---
name: fsd-scaffold
description: Scaffold FSD (Feature-Sliced Design) folder structure and files when writing code for a Next.js project. Use when the user asks to implement a new feature or entity — creates missing directories and files following FSD conventions before writing any code.
---

# FSD Scaffold

When asked to write code for a feature or entity, **check if the slice exists first** — scaffold any missing structure before implementing.

## Slice Structure

```
src/[entities|features]/<slice-name>/
├── api/
│   ├── service.ts
│   ├── query.ts
│   └── actions.ts  (features only)
├── model/
│   └── dto.ts
├── ui/
│   ├── ComponentName.tsx
│   └── index.ts    ← barrel file, re-exports all ui components
├── types/
├── constants/
└── index.ts        ← barrel file, re-exports the slice's public API
```

## Layer Rules

- **`entities/`** — read-only domain data (fetching only, no mutations)
- **`features/`** — user interactions that mutate data (requires `actions.ts`)

## Process

### 1. Check existing structure

Use `find` or `ls` to check whether `src/entities/<name>/` or `src/features/<name>/` already exists.

### 2. Determine the layer

- GET only → `entities/`
- PATCH / POST / PUT / DELETE → `features/`

### 3. Scaffold missing directories and files

Create only what is needed for the current task. Always create `index.ts` to export the slice's public API.

### 4. Read conventions before writing each file type

**Before creating any file, read the relevant convention file:**

| File being created | Convention file to read |
|---|---|
| `api/service.ts`, `api/query.ts`, `api/actions.ts` | [api.md](api.md) |
| `model/dto.ts` | [model.md](model.md) |
| `test/*.test.ts(x)` | [test.md](test.md) |

### 5. Implement the requested code

Follow the loaded conventions exactly.
