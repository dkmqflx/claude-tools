---
name: start-branch
description: Create a new git branch with an appropriate name for the current task and switch to it immediately — no new worktree directory, just a branch. Use when the user wants to start work on a fresh branch from the current position — phrases like "브랜치 만들어줘", "새 브랜치에서 작업 시작", "start a new branch", "create a branch for this", "작업 브랜치 파줘", "/start-branch". Do NOT use when the user explicitly wants a worktree (separate directory).
license: MIT
metadata:
  author: dkmqflx
  version: "1.0.0"
---

# Start Branch

Generate an appropriate branch name for the task and switch to it in the current working tree.

## When to apply

Starting work on a new feature, fix, or task directly in the current directory. **Do not apply** for worktree (separate checkout directory) — that is `/worktree`.

## Branch naming convention

Format: `<type>/<short-description>`

| Type | When to use |
|------|-------------|
| `feat/` | New feature or capability |
| `fix/` | Bug fix |
| `chore/` | Maintenance, config, dependency updates |
| `refactor/` | Restructuring without behavior change |
| `docs/` | Documentation only |
| `test/` | Test additions or changes |

Description rules: lowercase, hyphen-separated, 2–5 words, describes WHAT (not HOW).

**Examples:** `feat/user-authentication`, `fix/cart-total-calculation`, `chore/update-eslint-config`, `refactor/extract-payment-service`

## Steps

1. Derive the branch name from the user's task description using the convention above.
   If no task description was given (bare `/start-branch`), ask one short question first.
2. Create and switch to the branch:
   ```bash
   git checkout -b <branch-name>
   ```
3. Confirm in one line: `Switched to new branch: <branch-name>`
4. Begin the user's task.
