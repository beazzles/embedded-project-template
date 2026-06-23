#!/usr/bin/env bash

set -euo pipefail

echo "Checking test traceability..."

FAIL=0

check_requirement_exists()
{
    local ID="$1"

    case "$ID" in
        SWE*)
            test -f "requirements/software/${ID}.md"
            ;;
        VER*)
            test -f "requirements/verification/${ID}.md"
            ;;
        TST*)
            test -f "requirements/test/${ID}.md"
            ;;
        *)
            return 1
            ;;
    esac
}

while IFS= read -r FILE
do
    TEST_COUNT=$(grep -c "TEST(" "$FILE" || true)
    REQ_COUNT=$(grep -c "@req" "$FILE" || true)
    VER_COUNT=$(grep -c "@ver" "$FILE" || true)
    TST_COUNT=$(grep -c "@tst" "$FILE" || true)

    REQ_IDS=$(grep -o "@req SWE[0-9]\+" "$FILE" | awk '{print $2}' || true)
    VER_IDS=$(grep -o "@ver VER[0-9]\+" "$FILE" | awk '{print $2}' || true)
    TST_IDS=$(grep -o "@tst TST[0-9]\+" "$FILE" | awk '{print $2}' || true)

    if [ "$TEST_COUNT" -ne "$REQ_COUNT" ] ||
       [ "$TEST_COUNT" -ne "$VER_COUNT" ] ||
       [ "$TEST_COUNT" -ne "$TST_COUNT" ]
    then
        echo "ERROR: Traceability mismatch in $FILE"
        echo "  TEST: $TEST_COUNT"
        echo "  @req: $REQ_COUNT"
        echo "  @ver: $VER_COUNT"
        echo "  @tst: $TST_COUNT"
        FAIL=1
    fi

    for ID in $REQ_IDS
    do
        if ! check_requirement_exists "$ID"
        then
            echo "ERROR: Missing requirement file for $ID"
            FAIL=1
        fi
    done

    for ID in $VER_IDS
    do
        if ! check_requirement_exists "$ID"
        then
            echo "ERROR: Missing verification file for $ID"
            FAIL=1
        fi
    done

    for ID in $TST_IDS
    do
        if ! check_requirement_exists "$ID"
        then
            echo "ERROR: Missing test specification file for $ID"
            FAIL=1
        fi
    done

    for FILE in requirements/software/*.md
    do
        ID=$(basename "$FILE" .md)

        if ! grep -R "@req $ID" tests >/dev/null
        then
            echo "ERROR: No test references requirement $ID"
            FAIL=1
        fi
    done

    for FILE in requirements/verification/*.md
    do
        ID=$(basename "$FILE" .md)

        if ! grep -R "@ver $ID" tests >/dev/null
        then
            echo "ERROR: No test references verification $ID"
            FAIL=1
        fi
    done

    for FILE in requirements/test/*.md
    do
        ID=$(basename "$FILE" .md)

        if ! grep -R "@tst $ID" tests >/dev/null
        then
            echo "ERROR: No test references test specification $ID"
            FAIL=1
        fi
    done

done < <(find tests -name "*.cpp")

if [ "$FAIL" -ne 0 ]
then
    echo "Traceability check failed."
    exit 1
fi

echo "Traceability check passed."