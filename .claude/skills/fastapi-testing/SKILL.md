---
name: fastapi-testing
description: FastAPI testing best practices. Use when writing or reviewing tests for a FastAPI app — TestClient, dependency_overrides, async httpx clients. Triggers on TestClient, AsyncClient, ASGITransport, dependency_overrides, or pytest test files for FastAPI endpoints.
license: MIT
metadata:
  author: dkmqflx
  version: "1.0.0"
---

# FastAPI Testing

Best practices for testing FastAPI applications, following the official testing docs
(https://fastapi.tiangolo.com/tutorial/testing/). Covers exercising endpoints through
real HTTP semantics via `TestClient`/`AsyncClient`, and swapping dependencies safely
with `dependency_overrides`. Each rule pairs an antipattern with the idiomatic pytest
pattern.

## When to Apply

Reference these guidelines when:
- Writing tests for FastAPI path operations
- Swapping a dependency (DB session, auth, external client) for a test double
- Writing async tests against an ASGI app without a running server
- Reviewing or refactoring an existing FastAPI test suite

## Rules

- `testclient` (HIGH) — test endpoints through `fastapi.testclient.TestClient` (real HTTP, in-process)
- `dependency-overrides` (HIGH) — swap deps with `app.dependency_overrides`, not monkeypatch
- `async-client` (MEDIUM) — use httpx `AsyncClient` + `ASGITransport` for async tests

## How to Use

Read the individual rule file for the detailed explanation and before/after example:

```
rules/testclient.md
rules/dependency-overrides.md
rules/async-client.md
```

Each rule file contains:
- A short explanation of why it matters, tied to the official docs
- An **Incorrect** example (the antipattern)
- A **Correct** example (the official pattern)
- A link to the relevant page on https://fastapi.tiangolo.com/

All examples follow the official FastAPI documentation and avoid deprecated APIs.
