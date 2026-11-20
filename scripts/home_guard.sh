#!/bin/bash
# USER-LEVEL guard, installed by scripts/setup.sh into ~/.claude/hooks/.
# Problem it solves: if VS Code is opened with no folder, Claude starts in the
# home folder, never sees this repo's instructions, and nothing gets saved or
# backed up. (This happened for weeks on a real setup before anyone noticed.)
# When a session starts in exactly $HOME, this reopens the real workspace and
# tells Claude not to do work there. Any other folder: does nothing.

WORKSPACE="__WORKSPACE_PATH__"
[ "$(pwd -P)" = "$(cd "$HOME" && pwd -P)" ] || exit 0

if [ -f "$WORKSPACE" ] && command -v code >/dev/null 2>&1; then
  code "$WORKSPACE" >/dev/null 2>&1 &
fi

cat <<MSG
WRONG FOLDER: this Claude session started in the home folder, not in the owner's workspace.
Nothing done here is saved or backed up, and the workspace instructions are not loaded.
Do NOT start work here. Tell the owner, plainly and kindly: "We're in the wrong window. I've opened your workspace in a new VS Code window. Please continue there and close this one."
Workspace: $WORKSPACE
MSG
exit 0
