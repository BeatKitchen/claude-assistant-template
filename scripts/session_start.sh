#!/bin/bash
# Runs automatically at the start of every Claude Code session in this folder
# (wired in .claude/settings.json as a SessionStart hook). Whatever it prints
# is handed to Claude as context, so the startup checks happen even if the
# owner jumps straight into a task. Never fails the session.

cd "${CLAUDE_PROJECT_DIR:-$(git rev-parse --show-toplevel 2>/dev/null || pwd)}" 2>/dev/null || exit 0
git rev-parse --git-dir >/dev/null 2>&1 || { echo "SESSION CHECK: this folder is not a git repository. Tell the owner and stop before doing work."; exit 0; }

echo "SESSION CHECK (automatic; read before replying):"

# 1. Guardrail hooks: local git config does not travel with a clone, so re-set every session.
if [ "$(git config core.hooksPath 2>/dev/null)" != ".githooks" ]; then
  git config core.hooksPath .githooks 2>/dev/null && echo "- Re-enabled the repo's git hooks (.githooks)."
fi

# 2. Sync: fetch quietly, never merge or rebase automatically.
BRANCH="$(git symbolic-ref --short HEAD 2>/dev/null || echo DETACHED)"
if git remote get-url origin >/dev/null 2>&1; then
  if git fetch --quiet origin 2>/dev/null; then
    UP="origin/$BRANCH"
    if git rev-parse --verify --quiet "$UP" >/dev/null; then
      BEHIND=$(git rev-list --count "HEAD..$UP" 2>/dev/null || echo 0)
      AHEAD=$(git rev-list --count "$UP..HEAD" 2>/dev/null || echo 0)
      echo "- Branch $BRANCH: $BEHIND commit(s) behind the backup, $AHEAD not yet backed up."
      [ "$BEHIND" != "0" ] && echo "  -> Run 'git pull --ff-only' before any work. If it refuses, stop and route to the tech partner (or explain, for a technical owner)."
    fi
  else
    echo "- Could not reach GitHub (offline or sign-in expired). Work can continue locally; mention it once, plainly. If it persists across sessions, route to the tech partner: the backup is not happening."
  fi
else
  echo "- No GitHub backup is connected yet (no 'origin' remote). Mention it once and offer to help set one up."
fi

# 3. Unsaved work from a previous session.
DIRTY=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
[ "$DIRTY" != "0" ] && echo "- $DIRTY file(s) have changes that were never saved (committed). Capture them before new work; ask what they were if unclear."

# 4. Notes left by other sessions (ICCP). Show recent ones; Claude matches its own label.
NOTES=$(git log --since="14 days ago" --format='%h %ad %s' --date=short --all 2>/dev/null | grep '→' | head -10)
if [ -n "$NOTES" ]; then
  echo "- Recent notes between sessions (pick up any addressed to THIS session's label with 'git show <hash>'):"
  echo "$NOTES" | sed 's/^/    /'
fi

# 5. Onboarding still pending?
grep -q '\[PLACEHOLDER\]' docs/BUSINESS_CONTEXT.md 2>/dev/null && echo "- Onboarding is NOT done yet (docs/BUSINESS_CONTEXT.md has placeholders). Start Phase 0 in START_HERE.md."

echo "- Read START_HERE.md and docs/WORKING_WITH_OWNER.md (if it exists) before non-trivial work. End every reply with a short TL;DR."
exit 0
