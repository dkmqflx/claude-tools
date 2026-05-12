# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

A personal collection of Claude Code skills and reference documentation. No build system or test runner — all content is Markdown and shell scripts.

## Structure

```
md/        Reference documents (guidelines, patterns, notes)
skills/    Claude Code custom skills (each skill is a self-contained directory)
```

## Skills Format

Each skill under `skills/` must have a `SKILL.md` with YAML frontmatter:

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

- **`skills/testing-patterns/`** — Vitest + Testing Library patterns for a Next.js/FSD project. Includes `template.md` (boilerplate), `examples/sample.md` (full worked example), and `scripts/validate.sh` (lints a test file against conventions).
- **`skills/vercel-react-best-practices/`** — 57 React/Next.js performance rules from Vercel Engineering, organized in `rules/` by category prefix (`async-`, `bundle-`, `server-`, `client-`, `rerender-`, `rendering-`, `js-`, `advanced-`). `AGENTS.md` is the full compiled document; `SKILL.md` is the quick-reference index.

### Validate a test file against testing-patterns conventions

```bash
bash skills/testing-patterns/scripts/validate.sh <path-to-test-file>
```

## Adding Content

- **New skill**: create `skills/<name>/SKILL.md` with the frontmatter above, then add supporting files (`rules/`, `template.md`, `examples/`, etc.) as needed.
- **New reference doc**: add a Markdown file under `md/` and link it from `README.md`.
