#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status.
set -e
## Treat undefined variables as an error
set -u
# fails if any part of a pipeline (|) fails
set -o pipefail

SCRIPT_DIR="$(realpath "$(dirname -- "${BASH_SOURCE[0]}")")"

TMP="$SCRIPT_DIR/.tmp"

rm -rf "$TMP"

mkdir -p "$TMP/res_mods/version/"

cp -r "$SCRIPT_DIR/gui" "$TMP/res_mods/version/"

pushd "$TMP"

zip -r "$SCRIPT_DIR/modern_battle_indicators.zip" "."

popd

rm -rf "$TMP"
