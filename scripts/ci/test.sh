#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

cd "${PROJECT_ROOT}"

mkdir -p reports/tests

ctest \
    --test-dir build \
    --output-on-failure \
    --output-junit "${PROJECT_ROOT}/reports/tests/junit.xml"

echo "Test report generated:"
echo "  reports/tests/junit.xml"