#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

cd "${PROJECT_ROOT}"

mkdir -p reports/coverage

echo "Generating coverage summary..."
gcovr .

echo "Generating HTML coverage report..."
gcovr \
    --root . \
    --html \
    --html-details \
    --output reports/coverage/index.html

echo "Generating XML coverage report..."
gcovr \
    --root . \
    --xml-pretty \
    --output reports/coverage/coverage.xml

echo "Coverage reports generated:"
echo "  reports/coverage/index.html"
echo "  reports/coverage/coverage.xml"