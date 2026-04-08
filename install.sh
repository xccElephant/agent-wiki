#!/bin/sh

set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
FORCE=0

if [ "${1:-}" = "--force" ] || [ "${1:-}" = "-f" ]; then
  FORCE=1
fi

copy_if_needed() {
  src="$1"
  dst="$2"

  if [ ! -f "$src" ]; then
    echo "Missing template: $src" >&2
    exit 1
  fi

  if [ -e "$dst" ] && [ "$FORCE" -ne 1 ]; then
    echo "Skip existing: $dst"
    return
  fi

  cp "$src" "$dst"
  echo "Wrote: $dst"
}

mkdir -p "$ROOT_DIR/logs" "$ROOT_DIR/wiki"

copy_if_needed "$ROOT_DIR/wiki/index.template.md" "$ROOT_DIR/wiki/index.md"
copy_if_needed "$ROOT_DIR/logs/log.template.md" "$ROOT_DIR/logs/log.md"

cat <<'EOF'
Bootstrap complete.

Next steps:
1. Put source files into raw/articles/
2. Open the vault in Obsidian
3. Open the same folder in Cursor, Claude Code, or Codex
4. Ask the agent to ingest a source into wiki/source-notes/

Use --force to overwrite existing wiki/index.md or logs/log.md.
EOF
