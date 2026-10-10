#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
    echo "Usage: $0 <path-to-ann-benchmarks-root>"
    exit 1
fi

ANN_ROOT="$1"
TARGET_DIR="${ANN_ROOT}/ann_benchmarks/algorithms/silicium"

echo "Installing Silicium algorithm into ${TARGET_DIR}..."
mkdir -p "${TARGET_DIR}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cp -f "${SCRIPT_DIR}/ann_benchmarks/algorithms/silicium/Dockerfile" "${TARGET_DIR}/Dockerfile"
cp -f "${SCRIPT_DIR}/ann_benchmarks/algorithms/silicium/config.yml" "${TARGET_DIR}/config.yml"
cp -f "${SCRIPT_DIR}/ann_benchmarks/algorithms/silicium/module.py" "${TARGET_DIR}/module.py"

echo "Installation complete."
echo "You can now run:"
echo "  python run.py --algorithm silicium --dataset random-xs-20-angular"
