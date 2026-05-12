# Test Conventions

## Test File Location

```
src/features/{slice-name}/test/{FileName}.test.{ts,tsx}
```

## When to Test vs Skip

| File type | Decision |
|-----------|----------|
| Pure UI component (renders props only, no state/logic) | **Skip** |
| Simple child component (thin wrapper) | **Skip** |
| Component with API / state / context | **Integration test** |
| Custom hook | **Unit test** |
| Server action / service function | **Unit test** |
| Pure util function | **Unit test** |

State the skip decision explicitly before writing any tests.

---

## Framework

Vitest + jsdom. Globals (`describe`, `it`, `expect`, `vi`) are enabled — no imports needed. Import `vi` explicitly only when mocking.

**Test utilities** (`@/shared/test`):
- `renderWithClient(ui)` — wraps with `QueryClientProvider`
- `createWrapper()` — wrapper factory for `renderHook`

---

## Mock Hierarchy (always in this order)

```ts
// 1. Hoist stable references for mocks used in vi.mock factories
const { mockPush, mockGet } = vi.hoisted(() => ({
  mockPush: vi.fn(),
  mockGet: vi.fn(),
}));

// 2. Next.js navigation
vi.mock("next/navigation", () => ({
  useRouter: () => ({ push: mockPush }),
  useSearchParams: () => ({ get: mockGet }),
}));

// 3. TanStack Query hooks (prevent real Firebase calls)
vi.mock("../api/query", () => ({
  useSomeQuery: () => ({ data: undefined }),
  useSomeMutation: () => ({ mutate: vi.fn(), isPending: false }),
}));

// 4. Auth
vi.mock("@/app/hooks/useAuthUser", () => ({
  useAuthUser: () => ({ userId: "user-1" }),
}));

// 5. Firebase Admin (server action tests only)
vi.mock("@/firebase/admin", () => ({
  adminDb: {
    collection: vi.fn().mockReturnValue({
      doc: vi.fn().mockReturnValue({ get: mockGet, update: vi.fn() }),
    }),
  },
}));
```

---

## Assertion Rules

- **Component tests**: assert what the user sees — `getByRole`, `getByText`, `getByTestId`
- Never assert `Store.getState()` in component tests (tests internal implementation)
- **Server action tests**: assert return value and mock call arguments
- **Hook tests**: assert returned values after `act()`

---

## Test Structure

```ts
// Factory function for repeated fixture data
const makeItem = (overrides: Partial<ItemType> = {}): ItemType => ({
  id: "item-1",
  name: "Default",
  ...overrides,
});

describe("ComponentName", () => {
  beforeEach(() => {
    mockPush.mockReset();
    // useMyStore.setState({ ... });
  });

  describe("when [condition]", () => {
    it("should [expected behavior]", async () => {
      const user = userEvent.setup();
      // arrange → act → assert
    });
  });
});
```

- `it()` descriptions follow **"should … when …"** pattern
- One `it()` = one behavior (SRP)
- Use `userEvent`, never `fireEvent`

---

## Zustand Stores

Since `vi.mock("zustand")` is applied globally in the setup file, set state via `setState` in `beforeEach`:

```ts
useMyStore.setState({ field: "value" });
```

---

## After Writing Tests

Run `npm test -- <file>` to confirm all tests pass. Fix any failures before moving on.
