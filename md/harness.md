# Global Claude Code Guide

Working-session principles based on Anthropic's public guidance. Apply these across all projects.

## The 40% Context Golden Rule

- Keep context usage at or below 40% when an implementation task is complete.
- If you exceed 40%, it is one of two things:
  1. The work unit is too large → split it into smaller pieces.
  2. Too much unnecessary information is accumulating → clean it up or move to a fresh session.

## One Feature at a Time

Do not bundle multiple features into a single session. Repeat per feature:

1. Finish one feature → **git commit** (write a detailed message).
2. Update the progress file — a handoff note for the next session (`claude-progress.txt`).
3. Start the next session — repeat from a clean state.

## Six-Step New Session Routine

1. Run `pwd` — confirm the current working directory.
2. Read `claude-progress.txt` — understand what has been done so far.
3. Read `feature_list.json` — check what needs to be done next.
4. Check `git log` — skim the last 20 commits.
5. Run `init.sh` — start the development server.
6. Smoke-test the basics — confirm the app works before starting new work.

## Using Forks

Use forks so detailed sub-tasks do not pollute the main session's clean context:

1. Fork from a main session that has accumulated enough context.
2. Do the detailed work in the fork — even if the context gets polluted, the main session stays safe.
3. Discard the fork when done — the main session is preserved as-is.

Rule of thumb: **fork before context exceeds 40%.** The core purpose of forking is to protect the main session's clean context.
