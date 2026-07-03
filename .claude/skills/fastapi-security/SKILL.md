---
name: fastapi-security
description: FastAPI security and authentication best practices. Use when implementing or reviewing auth in FastAPI — OAuth2PasswordBearer, get_current_user dependencies, router-level auth, password hashing, token endpoints. Triggers on OAuth2PasswordBearer, OAuth2PasswordRequestForm, get_current_user, or Depends-based auth.
license: MIT
metadata:
  author: dkmqflx
  version: "1.0.0"
---

# FastAPI Security & Authentication

Best practices for securing FastAPI applications, following the official security docs
(https://fastapi.tiangolo.com/tutorial/security/). Covers extracting and validating
Bearer tokens, resolving the current user as a dependency, protecting route groups,
hashing passwords, and building the token-issuing endpoint. Each rule pairs an
antipattern with the official FastAPI pattern.

## When to Apply

Reference these guidelines when:
- Extracting or validating a Bearer token from the `Authorization` header
- Resolving the current authenticated user in a dependency
- Protecting a group of routes at the `APIRouter` level
- Hashing and verifying passwords
- Building the `/token` (or equivalent) login endpoint

## Rules

- `oauth2-bearer` (CRITICAL) — extract Bearer tokens with `OAuth2PasswordBearer` + `Annotated`
- `get-current-user` (CRITICAL) — resolve the current user in a `get_current_user` dependency
- `router-auth` (HIGH) — protect route groups via `APIRouter(dependencies=[...])`
- `password-hashing` (CRITICAL) — hash passwords (pwdlib/passlib); never store plaintext
- `token-endpoint` (HIGH) — build the token route with `OAuth2PasswordRequestForm`

## How to Use

Read the individual rule file for the detailed explanation and before/after example:

```
rules/oauth2-bearer.md
rules/get-current-user.md
rules/router-auth.md
rules/password-hashing.md
rules/token-endpoint.md
```

Each rule file contains:
- A short explanation of why it matters, tied to the official docs
- An **Incorrect** example (the antipattern)
- A **Correct** example (the official pattern)
- A link to the relevant page on https://fastapi.tiangolo.com/

All examples follow the official FastAPI documentation and avoid deprecated APIs.
