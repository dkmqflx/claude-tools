# Worktree Cleanup

Remove the current git worktree, switch the main checkout to the dev branch, and delete the feature branch.

Use this when finishing work that was started with `/worktree` (or the `worktree` skill).

## Steps

1. Verify the current directory is inside a **worktree** (not the main checkout).
   - Compare `git rev-parse --git-dir` and `git rev-parse --git-common-dir`. If they are equal, this is the main checkout — stop and tell the user to use `/done` instead.
2. Record the current worktree path (`git rev-parse --show-toplevel`) and current branch name (`git rev-parse --abbrev-ref HEAD`).
3. If the branch is `dev` or `master`, stop and notify the user.
4. Check for uncommitted changes (`git status --porcelain`). If any exist, stop and report them — do not force removal.
5. Resolve the main checkout path: parse `git worktree list --porcelain` and take the first `worktree <path>` entry.
6. `cd` into the main checkout path.
7. Checkout the dev branch and pull from `origin/dev`.
8. Remove the worktree: `git worktree remove <recorded worktree path>`.
9. Delete the feature branch locally: `git branch -D <recorded branch>`.

## Guardrails

- Never run `git worktree remove --force`. If removal fails due to dirty state, stop and report.
- Never delete `dev` or `master`.
- Do not run this from the main checkout — that is `/done`'s job.
