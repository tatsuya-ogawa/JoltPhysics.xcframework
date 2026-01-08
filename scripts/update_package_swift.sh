#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PACKAGE_SWIFT="$ROOT_DIR/Package.swift"

if [[ $# -ne 2 ]]; then
	echo "Usage: $0 <url> <checksum>"
	exit 1
fi

URL="$1"
CHECKSUM="$2"

python3 - <<PY
from pathlib import Path
pkg = Path("$PACKAGE_SWIFT")
text = pkg.read_text()
text = text.replace("__JOLT_URL__", "$URL")
text = text.replace("__JOLT_CHECKSUM__", "$CHECKSUM")
pkg.write_text(text)
PY

echo "Updated $PACKAGE_SWIFT"
