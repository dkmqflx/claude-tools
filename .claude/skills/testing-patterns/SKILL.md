---
name: testing-patterns
description: Vitest testing patterns for this project. Automatically applied when writing unit/integration tests for components, custom hooks, Server Actions, and utility functions.
license: MIT
metadata:
  author: careermizing
  version: "2.1.0"
---

# Testing Patterns

Boilerplate → `template.md` | Full example → `examples/sample.md` | Validate → `scripts/validate.sh`

## Setup

- Framework: Vitest + jsdom
- File location: `src/features/{name}/test/*.test.{ts,tsx}`
- Setup file: `src/shared/test/setup.ts` — global `vi.mock("zustand")`, `vi.clearAllMocks()` in afterEach
- Libraries: `@testing-library/react`, `@testing-library/user-event`

## What to Test

| Target | Type | Key rule |
|--------|------|----------|
| Pure UI components (no state/logic) | **Skip** | No value — visual tools (Storybook) instead |
| Simple child components | **Skip** | Covered by parent's integration test |
| Pure functions, utils | Unit | No external dependencies; used widely → stability matters |
| Custom hooks | Unit | `renderHook`, mock next/navigation |
| Components with API/state/context | Integration | Wire real stores/hooks, mock only externals |
| Server Action / Service | Integration | Mock Firebase Admin, mock external APIs |

## Rules

### What & how to test
- Test **interfaces and behavior** (what the user sees in the UI), not internal implementation details
- Internal state/variable assertions → brittle tests coupled to implementation; prefer UI assertions
- One `it()` = one behavior — SRP applies to tests too
- Write **meaningful** tests: ask "what would break if this logic changes?" not "how do I hit 100% coverage"
- Prefer UI assertions (`getByRole`, `getByText`, `getByTestId`) over `Store.getState()` in component tests

### Mocking
- Mock **externals only**: Firebase, TanStack Query hooks, Next.js navigation
- **Minimize mocking** — excessive mocks reduce reliability and create tests that pass when production breaks
- Business logic (state management, API calls) should be cohesive in the parent component — mock at that boundary
- Split integration tests by business logic domain; don't combine unrelated domains in one test
- Always use `vi.hoisted()` for mock references needed before `vi.mock()` calls
- Rely on `vi.clearAllMocks()` from setup.ts; explicitly reset mocks with specific return values in `beforeEach`

### Style
- Always use `userEvent`, never `fireEvent`
- `it` descriptions follow **"should ... when ..."** pattern
- Group related cases in `describe` blocks
- Factory functions for repeated fixture data

## File Location

```
src/features/{name}/
  test/
    {ComponentName}.test.tsx     # component integration tests
    {hookName}.test.ts           # custom hook unit tests
    {fileName}.test.ts           # service/action tests
    {utilName}.test.ts           # pure function unit tests
```
