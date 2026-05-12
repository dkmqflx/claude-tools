# CLAUDE.md

Project-specific guidance for Careermizing. General Claude Code workflow rules live in `~/.claude/CLAUDE.md`.

## Project Overview

## Commands

See `package.json` scripts. Key ones: `npm run dev`, `npm run build`, `npm test`, `npm run test:e2e`, `npm run test:all`.

## Testing

Writing tests is required — every feature PR must add or update tests in the same change.

- **Unit (Vitest)**: pure functions, hooks, single-component branching. File: `*.test.ts(x)`.
- **Integration (Vitest + Testing Library)**: multi-component/hook flows. In `__tests__/` or `test/`.
- **E2E (Playwright)**: core scenarios in `e2e/tests/*.spec.ts`. Must pass on **chromium and webkit**. Mock external API/Firebase with JSON fixtures in `e2e/fixtures/` — never hit a real backend.
- Changes that affect user scenarios must add or update E2E tests.
- No merging without tests (emergency hotfixes backfilled afterwards).

## Architecture

Follows **Feature-Sliced Design (FSD)**:

- `app/` — Next.js App Router pages, layouts, API routes
- `src/features/`, `src/entities/`, `src/shared/`, `src/widgets/` — FSD layers
- `firebase/` — Firebase initialization

### State Management

- **TanStack Query (current)**: used in FSD layers (`src/`). Use for all new features.

## Configuration References

- **Path aliases**: see `tsconfig.json` (`@/*`, `@/features/*`, `@/entities/*`, `@/shared/*`, `@/providers/*`, `@/pages/*`).
- **Environment variables**: see `.env.development` for the required keys (Firebase, OpenAI, Gemini, Toss).
- **Firestore indexes**: `firestore.indexes.json` — deploy with `firebase deploy --only firestore:indexes`.
- **Firestore security rules**: this repo does not keep a `firestore.rules` file. Per-collection partials live under `docs/firestore/` and are merged with the existing console rules before deployment. See `docs/firestore/README.md`.

## Commit & PR Conventions

- **Commits**: follow `.gitmessage.txt`.
- **PR template**: `.github/PULL_REQUEST_TEMPLATE.md`.
- **PR title format**: `[Type] Title` — type capitalized in brackets (`[Feat]`, `[Fix]`, `[Chore]`, `[Refactor]`, `[Style]`, `[Docs]`).
- **Notion Project / Notion Task** links must be provided by the user — ask if not given.
- **Description**: summarize the changes from the diff.
- **Checklist**: add items relevant to the changes.
