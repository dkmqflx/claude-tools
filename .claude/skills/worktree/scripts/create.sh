#!/usr/bin/env bash
# Create a sibling git worktree on a fresh branch.
#
# Usage:   bash scripts/create.sh <branch-name>
# Stdout:  absolute path of the new worktree (single line)
# Stderr:  human-readable progress / errors
#
# The caller is responsible for `cd`-ing into the printed path —
# a child shell cannot change the parent's working directory.

set -euo pipefail

BRANCH="${1:?usage: create.sh <branch-name>}"

if ! REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null)"; then
  echo "error: not inside a git repository" >&2
  exit 1
fi

REPO_NAME="$(basename "$REPO_ROOT")"
PARENT="$(dirname "$REPO_ROOT")"

# Ensure branch name is unique locally (suffix -2, -3, ...).
n=2
candidate="$BRANCH"
while git show-ref --verify --quiet "refs/heads/$candidate"; do
  candidate="${BRANCH}-${n}"
  n=$((n + 1))
done
BRANCH="$candidate"

# Ensure worktree path is unique on disk (same suffix scheme).
WT_PATH="${PARENT}/${REPO_NAME}-${BRANCH}"
n=2
while [ -e "$WT_PATH" ]; do
  WT_PATH="${PARENT}/${REPO_NAME}-${BRANCH}-${n}"
  n=$((n + 1))
done

echo "creating worktree: $WT_PATH (branch: $BRANCH)" >&2
git worktree add "$WT_PATH" -b "$BRANCH" >&2

echo "$WT_PATH"
