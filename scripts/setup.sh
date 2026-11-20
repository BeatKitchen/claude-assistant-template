#!/bin/bash
# One-time setup for a fresh clone (Mac or Linux; on Windows run it from Git Bash).
# Safe to re-run anytime. It never deletes anything.
#   bash scripts/setup.sh
set -u

REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null)"
[ -z "$REPO_ROOT" ] && { echo "Run this from inside the cloned folder."; exit 1; }
cd "$REPO_ROOT"
WS="$(ls "$REPO_ROOT"/*.code-workspace 2>/dev/null | head -1)"

echo "Setting up $(basename "$REPO_ROOT")..."

# 1. Guardrail git hooks (local config, must be set per clone).
git config core.hooksPath .githooks && chmod +x .githooks/* scripts/*.sh 2>/dev/null
echo "OK  git hooks enabled"

# 2. Hugo theme, if a website with a theme submodule exists.
if [ -f .gitmodules ]; then
  git submodule update --init --recursive >/dev/null 2>&1 && echo "OK  website theme ready" \
    || echo "!!  theme download failed; run: git submodule update --init --recursive"
fi

# 3. GitHub sign-in that does not silently expire. Plain tokens pasted into
#    URLs or ~/.git-credentials have died quietly before and stopped backups
#    for weeks. The GitHub CLI stores sign-in in the system keychain instead.
if command -v gh >/dev/null 2>&1; then
  if gh auth status >/dev/null 2>&1; then
    gh auth setup-git >/dev/null 2>&1; echo "OK  GitHub sign-in (via GitHub CLI)"
  else
    echo "..  Sign in to GitHub (a browser window will open):"
    gh auth login --web --git-protocol https && gh auth setup-git && echo "OK  GitHub sign-in"
  fi
else
  echo "!!  GitHub CLI not installed. Mac: brew install gh   Windows: winget install GitHub.cli"
  echo "    Then re-run this script. (Backups to GitHub may fail without it.)"
fi

# 4. Wrong-folder guard (user-level Claude Code hook). Asks first.
if [ -n "$WS" ]; then
  printf "Install the wrong-folder guard (reopens this workspace if Claude starts in your home folder)? [Y/n] "
  read -r ans
  if [ "${ans:-Y}" != "n" ] && [ "${ans:-Y}" != "N" ]; then
    mkdir -p "$HOME/.claude/hooks"
    NAME="$(basename "$REPO_ROOT")"
    GUARD="$HOME/.claude/hooks/${NAME}-guard.sh"
    sed "s|__WORKSPACE_PATH__|$WS|" scripts/home_guard.sh > "$GUARD" && chmod +x "$GUARD"
    if command -v python3 >/dev/null 2>&1; then
      python3 - "$GUARD" <<'PY'
import json, os, sys, shutil
guard = sys.argv[1]
p = os.path.expanduser("~/.claude/settings.json")
s = {}
if os.path.exists(p):
    shutil.copy(p, p + ".bak")
    with open(p) as f:
        s = json.load(f)
hooks = s.setdefault("hooks", {}).setdefault("SessionStart", [])
cmd = f'bash "{guard}"'
if not any(h.get("command") == cmd for e in hooks for h in e.get("hooks", [])):
    hooks.append({"hooks": [{"type": "command", "command": cmd}]})
with open(p, "w") as f:
    json.dump(s, f, indent=2)
PY
      echo "OK  wrong-folder guard installed"
    else
      echo "!!  python3 not found; guard script written to $GUARD but not registered."
    fi
  fi

  # 5. One-click launcher on the Desktop.
  if [ -d "$HOME/Desktop" ]; then
    LNK="$HOME/Desktop/$(basename "$REPO_ROOT").code-workspace"
    [ -e "$LNK" ] || ln -s "$WS" "$LNK" 2>/dev/null
    echo "OK  Desktop shortcut: double-click \"$(basename "$LNK")\" to open your workspace"
  fi
fi

command -v hugo >/dev/null 2>&1 || echo "..  (Optional) Hugo is not installed; only needed if you build a website. Mac: brew install hugo"
echo ""
echo "Done. Open your workspace with the Desktop shortcut (or: code \"$WS\"),"
echo "click the Claude icon, and say: Read START_HERE.md and begin onboarding."
