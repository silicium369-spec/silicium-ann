#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION="${1:-ann-v1.0.0}"
DEST_DIR="${2:-/usr/local/lib}"
BASE_URL="https://github.com/silicium369-spec/silicium-ann/releases/download/${VERSION}"

echo "Fetching Silicium ANN release ${VERSION}..."
mkdir -p "${DEST_DIR}"
curl -fsSL -o "${DEST_DIR}/libsilicium_ann_x86_64.so" "${BASE_URL}/libsilicium_ann_x86_64.so"

echo "Verifying cryptographic SHA-256 integrity..."
PINNED_SHA="59e92c84a62667e83cde0f64bdb62bcbb91036898ba023895ba0d9d3c60e3d60"
echo "${PINNED_SHA}  ${DEST_DIR}/libsilicium_ann_x86_64.so" | sha256sum -c -

ldconfig 2>/dev/null || true
echo "Silicium ANN binary verified and installed in ${DEST_DIR}."
