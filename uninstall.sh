#!/bin/sh

REPO_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
UNINSTALLER="$REPO_DIR/uninstall"

exec sh "$UNINSTALLER" "$@"
