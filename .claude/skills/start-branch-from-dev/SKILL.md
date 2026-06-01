---
name: start-branch-from-dev
description: Sync the local dev branch to the latest remote, then create a new well-named branch from it and switch to it. Use when the user wants to start fresh work based on dev — phrases like "dev에서 브랜치 만들어줘", "dev 기준으로 작업 시작", "dev 기반 브랜치", "start from dev", "branch off dev", "/start-branch-from-dev". Do NOT use when branching from the current position is fine — use /start-branch for that.
license: MIT
metadata:
  author: dkmqflx
  version: "1.0.0"
---

# Start Branch from Dev

Pull the latest `dev`, then create a well-named branch for the task.

## When to apply

Starting work that must be based on the latest `dev`. **Do not apply** when branching off the current position is fine — that is `/start-branch`.

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
   If no task description was given (bare `/start-branch-from-dev`), ask one short question first.
2. Switch to dev and pull latest:
   ```bash
   git checkout dev && git pull
   ```
3. Create and switch to the new branch:
   ```bash
   git checkout -b <branch-name>
   ```
4. Confirm in one line: `Branched off latest dev → now on <branch-name>`
5. Begin the user's task.
