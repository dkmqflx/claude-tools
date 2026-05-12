# Sample: InterviewQuestion Component Test

A complete example with all project patterns applied.

Key principles:
- Assert based on the UI interface (what the user sees) — never assert internal store state directly
- One `it()` = one business behavior
- Mock only necessary external dependencies (Firebase, API, Next.js navigation)

```tsx
// src/features/interview/test/InterviewQuestion.test.tsx

import { render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import { InterviewQuestion } from "../ui/InterviewQuestion";
import { useInterviewStore } from "../model/interviewStore";

// 1. Stable mock references via vi.hoisted
//    searchParams creates a new object on every render → prevents infinite loop in useEffect deps
const { mockPush, mockGet, mockToString, mockSearchParams } = vi.hoisted(() => {
  const mockPush = vi.fn();
  const mockGet = vi.fn();
  const mockToString = vi.fn(() => "");
  const mockSearchParams = {
    get: (key: string) => mockGet(key),
    toString: () => mockToString(),
  };
  return { mockPush, mockGet, mockToString, mockSearchParams };
});

// 2. Next.js navigation
vi.mock("next/navigation", () => ({
  useRouter: () => ({ push: mockPush }),
  useSearchParams: () => mockSearchParams,
}));

// 3. TanStack Query hooks — prevent real Firebase calls
vi.mock("../api/query", () => ({
  useGetInterviewProfile: () => ({
    data: makeProfile(),
  }),
  useCreateInterviewProfileMutation: () => ({
    mutate: vi.fn(),
    isPending: false,
  }),
}));

// 4. Auth
vi.mock("@/app/hooks/useAuthUser", () => ({
  useAuthUser: () => ({ userId: "user-1" }),
}));

// 5. Heavy child components — expose testid and handlers only
vi.mock("../ui/BasicQuestionList", () => ({
  BasicQuestionList: ({ categoryId }: { categoryId: string }) => (
    <div data-testid="basic-question-list" data-category={categoryId} />
  ),
}));

vi.mock("../ui/BasicCategorySelector", () => ({
  BasicCategorySelector: ({
    categories,
    onValueChange,
  }: {
    categories: Array<{ id: string }>;
    onValueChange: (id: string) => void;
  }) => (
    <div data-testid="basic-category-selector">
      {categories.map((c) => (
        <button key={c.id} data-testid={`category-${c.id}`} onClick={() => onValueChange(c.id)}>
          {c.id}
        </button>
      ))}
    </div>
  ),
}));

// 6. Factory function for repeated fixture data
const makeProfile = (overrides: Partial<InterviewProfile> = {}): InterviewProfile => ({
  id: "p-1",
  companyName: "Acme Corp",
  jobRole: "Frontend Engineer",
  season: "2024.01.01",
  createdAt: 0,
  ...overrides,
});

describe("InterviewQuestion", () => {
  beforeEach(() => {
    mockPush.mockReset();
    mockGet.mockReset();
    mockToString.mockReturnValue("");

    // Initialize Zustand store state (auto-mocked via vi.mock("zustand") in setup.ts)
    useInterviewStore.setState({
      profileId: "p-1",
      selectedBasicCategoryId: undefined,
    });
  });

  describe("when category is selected", () => {
    it("should render question list for selected category", async () => {
      const user = userEvent.setup();
      render(<InterviewQuestion />);

      await user.click(screen.getByTestId("category-cat-1"));

      // ✅ Assert via UI interface — verify the correct category is reflected on screen
      // ❌ Do not assert useInterviewStore.getState().selectedBasicCategoryId directly
      expect(screen.getByTestId("basic-question-list")).toHaveAttribute(
        "data-category",
        "cat-1"
      );
    });
  });

  describe("when submit is clicked", () => {
    it("should navigate to result page", async () => {
      const user = userEvent.setup();
      render(<InterviewQuestion />);

      await user.click(screen.getByRole("button", { name: /submit/i }));

      // ✅ Assert by verifying the external module (Next.js router) was called correctly
      expect(mockPush).toHaveBeenCalledWith("/interview/result");
    });
  });

  describe("when profile data is loading", () => {
    it("should show loading state", () => {
      // To override query result for a specific test, redefine the mock inside beforeEach
      render(<InterviewQuestion />);

      expect(screen.getByRole("status")).toBeInTheDocument();
    });
  });
});
```

---

## Splitting Integration Test Scope

When multiple domain features are combined, split by business logic domain instead of writing one large test.

```
❌ One giant integration test covering login + product search + product list
✅ NavigationBar.test.tsx  — UI based on login state
✅ ProductFilter.test.tsx  — filter rendering based on search condition changes
✅ ProductList.test.tsx    — list rendering based on API response
```
