# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

A personal collection of Claude Code skills and reference documentation. No build system or test runner — all content is Markdown and shell scripts.

## Structure

```
md/              Reference documents (guidelines, patterns, notes)
.claude/skills/  All Claude Code skills (user-created and externally installed)
skills-lock.json Lock file tracking externally installed skills (via npx skills add)
```

## Skills Format

Each skill under `.claude/skills/` must have a `SKILL.md` with YAML frontmatter:

```markdown
---
name: skill-name
description: One-line trigger description used by Claude to decide when to load this skill.
license: MIT
metadata:
  author: <author>
  version: "1.0.0"
---
```

The `description` field is the most critical — it controls when Claude auto-applies the skill.

### Current Skills

- **`.claude/skills/testing-patterns/`** — Vitest + Testing Library patterns for a Next.js/FSD project. Includes `template.md` (boilerplate), `examples/sample.md` (full worked example), and `scripts/validate.sh` (lints a test file against conventions).
- **`.claude/skills/vercel-react-best-practices/`** — 57 React/Next.js performance rules from Vercel Engineering, organized in `rules/` by category prefix (`async-`, `bundle-`, `server-`, `client-`, `rerender-`, `rendering-`, `js-`, `advanced-`). `AGENTS.md` is the full compiled document; `SKILL.md` is the quick-reference index.
- **`.claude/skills/fsd-scaffold/`** — FSD structure scaffolding.
- **`.claude/skills/commit-each/`** — Split git changes into one commit per logical unit of work.
- **`.claude/skills/worktree/`** — Create a new git worktree on a fresh branch.
- **`.claude/skills/start-branch/`** — Create a new branch (current position) with an appropriate `feat/fix/chore/…` name and switch to it.
- **`.claude/skills/start-branch-from-dev/`** — Pull the latest `dev`, then create a new branch from it with an appropriate name.
- **`.claude/skills/open-pr/`** — Push the current branch and open a pull request against the detected base branch, with an AI-drafted title/body confirmed by the user.
- **`.claude/skills/branch-done/`** — After opening a PR, delete the current feature branch and switch back to the base branch.
- **`.claude/skills/worktree-done/`** — Remove the current git worktree, switch the main checkout to the base branch, and delete the feature branch.
- **`.claude/skills/turborepo/`** — Turborepo monorepo build system guidance. (installed via `npx skills add vercel/turborepo`)
- **`.claude/skills/next-best-practices/`** — Next.js best practices. (installed via `npx skills add vercel-labs/next-skills`)
- **`.claude/skills/vercel-composition-patterns/`** — Vercel composition patterns. (installed via `npx skills add vercel-labs/agent-skills`)

#### NestJS best practices

Twelve user-created skills (90 rules) covering NestJS's major features, grounded in the official NestJS docs. Each follows the `vercel-react-best-practices` format: a `SKILL.md` index plus `rules/*.md` files with `title`/`impact`/`tags` frontmatter and incorrect/correct TypeScript examples.

- **`.claude/skills/nestjs-modules-di/`** — Modules & dependency injection.
- **`.claude/skills/nestjs-controllers/`** — Controllers & routing.
- **`.claude/skills/nestjs-validation-pipes/`** — Validation & pipes.
- **`.claude/skills/nestjs-guards-auth/`** — Guards, authentication & authorization.
- **`.claude/skills/nestjs-interceptors/`** — Interceptors.
- **`.claude/skills/nestjs-exception-filters/`** — Exception handling & filters.
- **`.claude/skills/nestjs-config/`** — Configuration & env management.
- **`.claude/skills/nestjs-database/`** — Database & ORM (TypeORM/Prisma/Mongoose).
- **`.claude/skills/nestjs-caching-queues/`** — Caching & background-job queues (BullMQ).
- **`.claude/skills/nestjs-testing/`** — Unit & e2e testing.
- **`.claude/skills/nestjs-security/`** — Security hardening (helmet, throttler, CORS, CSRF).
- **`.claude/skills/nestjs-performance-logging/`** — Performance & structured logging/observability.

### Validate a test file against testing-patterns conventions

```bash
bash .claude/skills/testing-patterns/scripts/validate.sh <path-to-test-file>
```

## Adding Content

- **New skill (user-created)**: create `.claude/skills/<name>/SKILL.md` with the frontmatter above, then add supporting files (`rules/`, `template.md`, `examples/`, etc.) as needed.
- **External skill**: run `npx skills add <repo> [--skill <name>]` to install from GitHub into `.claude/skills/`; updates `skills-lock.json`.
- **New reference doc**: add a Markdown file under `md/` and link it from `README.md`.
