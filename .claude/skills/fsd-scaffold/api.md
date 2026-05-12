# API Layer Conventions

Covers `api/service.ts`, `api/query.ts`, and `api/actions.ts`.

## File Requirements by Layer

### Entities (Read-Only)

| File | Role | Required |
|------|------|----------|
| `api/service.ts` | Query functions (Firestore, external API) | ✓ |
| `api/query.ts` | `useQuery` hooks | ✓ |
| `api/actions.ts` | Server Actions | Optional |

### Features (Mutations)

| File | Role | Required |
|------|------|----------|
| `api/actions.ts` | Server Actions (PATCH/POST/PUT/DELETE) | ✓ |
| `api/query.ts` | `useMutation` + `useQuery` hooks | ✓ |
| `api/service.ts` | Client-side async (Storage, external API) | Optional |

---

## api/actions.ts (Server Actions)

- `"use server"` at the top of the file
- Import DTO types from `../model/dto`
- Use Firestore `adminDb` (server-side only — never use client SDK here)
- Include auth/permission checks before any write
- Proper error handling with typed returns

## api/service.ts (Client-Side Async)

- No `"use server"` directive
- Import DTO types from `../model/dto`
- Firebase Storage or external API calls only
- Browser-only functionality — never access adminDb here

## api/query.ts (TanStack Query)

- Import DTO types from `../model/dto`
- Define a Query Keys factory at the top (see pattern below)
- Use `useQuery` for reads, `useMutation` for writes
- `onSuccess` in mutations must invalidate related query keys

## Query Keys Factory Pattern

```typescript
export const userProfileKeys = {
  all: ["userProfile"] as const,
  lists: () => [...userProfileKeys.all, "list"] as const,
  details: () => [...userProfileKeys.all, "detail"] as const,
  detail: (id: string) => [...userProfileKeys.details(), id] as const,
};
```

---

## Task Guides

### Adding a GET Query

1. `model/dto.ts` — define Response DTO
2. `api/service.ts` — define query function
3. `api/query.ts` — add `useQuery` hook + Query Keys

### Adding PATCH / POST / PUT / DELETE

1. `model/dto.ts` — define Request/Response DTOs
2. `api/actions.ts` — define Server Action (required)
3. `api/service.ts` — add client functions if needed (Storage, etc.)
4. `api/query.ts` — add `useMutation` hook + Query Keys, invalidate on success
