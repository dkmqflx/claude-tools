# Test File Templates

## Component Integration Test

Target: verify **business logic** of components that combine API, state, and context.
Assertion style: UI-based (`getByRole`, `getByText`, `getByTestId`) — never assert internal state directly.

```tsx
import { render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import { ComponentName } from "../ui/ComponentName";

// 1. Hoist stable mock references (e.g. searchParams creates a new object on every render — causes infinite loop in useEffect deps)
const { mockPush, mockGet } = vi.hoisted(() => ({
  mockPush: vi.fn(),
  mockGet: vi.fn(),
}));

// 2. Mock Next.js navigation
vi.mock("next/navigation", () => ({
  useRouter: () => ({ push: mockPush }),
  useSearchParams: () => ({ get: mockGet }),
}));

// 3. Mock TanStack Query hooks (prevent real Firebase calls)
vi.mock("../api/query", () => ({
  useSomethingQuery: () => ({ data: undefined }),
  useSomethingMutation: () => ({ mutate: vi.fn(), isPending: false }),
}));

// 4. Mock auth
vi.mock("@/app/hooks/useAuthUser", () => ({
  useAuthUser: () => ({ userId: "user-1" }),
}));

// 5. Mock heavy child components minimally — expose testid and handlers only
vi.mock("../ui/HeavyChild", () => ({
  HeavyChild: ({ onAction }: { onAction: () => void }) => (
    <button data-testid="heavy-child" onClick={onAction}>action</button>
  ),
}));

// 6. Factory function for fixture data
const makeItem = (overrides: Partial<ItemType> = {}): ItemType => ({
  id: "item-1",
  name: "Default Name",
  ...overrides,
});

describe("ComponentName", () => {
  beforeEach(() => {
    mockPush.mockReset();
    mockGet.mockReset();
    // useMyStore.setState({ field: "value" });
  });

  describe("when [condition]", () => {
    it("should [expected behavior]", async () => {
      const user = userEvent.setup();

      // arrange
      render(<ComponentName />);

      // act
      await user.click(screen.getByRole("button", { name: /submit/i }));

      // assert — verify what the user sees, not Store.getState()
      expect(screen.getByText("success message")).toBeInTheDocument();
      expect(mockPush).toHaveBeenCalledWith("/next-page");
    });
  });
});
```

---

## Custom Hook Test

```ts
import { renderHook, act } from "@testing-library/react";
import { useMyHook } from "../hooks/useMyHook";

describe("useMyHook", () => {
  it("should [behavior] when [condition]", () => {
    const { result } = renderHook(() => useMyHook());

    act(() => {
      result.current.someAction("value");
    });

    expect(result.current.value).toBe("value");
  });
});
```

---

## Server Action Test

Verify business logic by checking return values and external module call arguments (no UI).

```ts
import { myServerAction } from "../actions";

const { mockGet, mockUpdate, mockRunTransaction } = vi.hoisted(() => ({
  mockGet: vi.fn(),
  mockUpdate: vi.fn(),
  mockRunTransaction: vi.fn(),
}));

vi.mock("@/firebase/admin", () => ({
  adminDb: {
    runTransaction: mockRunTransaction,
    collection: vi.fn().mockReturnValue({
      doc: vi.fn().mockReturnValue({
        get: mockGet,
        update: mockUpdate,
      }),
    }),
  },
}));

// Transaction helper — setup once, reuse across tests
const setupTransaction = ({ userExists = true } = {}) => {
  mockRunTransaction.mockImplementation(async (fn: (t: unknown) => unknown) => {
    const userDoc = { exists: userExists, data: () => ({}) };
    return await fn({
      get: vi.fn().mockResolvedValue(userDoc),
      update: vi.fn(),
      set: vi.fn(),
    });
  });
};

describe("myServerAction", () => {
  beforeEach(() => {
    mockGet.mockReset();
    mockUpdate.mockReset();
  });

  it("should [behavior] when [condition]", async () => {
    mockGet.mockResolvedValue({ exists: true, data: () => ({ field: "value" }) });

    const result = await myServerAction({ input: "test" });

    expect(result).toEqual({ success: true });
    expect(mockUpdate).toHaveBeenCalledWith({ field: "updated" });
  });
});
```

---

## Pre-write Checklist

- [ ] Does this component have state or business logic? (Skip if not)
- [ ] If it's a simple child component, is it already covered by the parent's integration test?
- [ ] Are you asserting the UI interface (what the user sees), not internal implementation?
- [ ] Does each `it()` verify exactly one behavior?
- [ ] Is mocking limited to necessary external dependencies (Firebase, API)?
