#!/bin/sh

REPO_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
SETUP="$REPO_DIR/setup"

exec bash "$SETUP" "$@"
