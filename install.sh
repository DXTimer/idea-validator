#!/usr/bin/env bash
# Symlink the validate-idea skill into ~/.claude/skills so Claude Code picks it up.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$REPO_DIR/skills/validate-idea"
DEST_DIR="$HOME/.claude/skills"
DEST="$DEST_DIR/validate-idea"

if [ ! -f "$SRC/SKILL.md" ]; then
  echo "error: $SRC/SKILL.md not found — run this from the repo." >&2
  exit 1
fi

mkdir -p "$DEST_DIR"

if [ -e "$DEST" ] || [ -L "$DEST" ]; then
  if [ -L "$DEST" ] && [ "$(readlink "$DEST")" = "$SRC" ]; then
    echo "already installed: $DEST -> $SRC"
    exit 0
  fi
  echo "error: $DEST already exists and is not our symlink. Remove it first." >&2
  exit 1
fi

ln -s "$SRC" "$DEST"
echo "installed: $DEST -> $SRC"
echo "Open Claude Code and run: /validate-idea <your idea>"
