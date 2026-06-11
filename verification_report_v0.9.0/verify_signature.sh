#!/bin/bash
# Master Copy T2 Report Signature Verification
# This script verifies that the report has not been tampered with.

echo "🔍 Verifying report signature..."
echo ""

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo "❌ Error: jq is not installed"
    echo "Install: brew install jq"
    exit 1
fi

# Extract signature hash
SIGNATURE=$(jq -r '.signature.hash' report.json)

if [ -z "$SIGNATURE" ] || [ "$SIGNATURE" = "null" ]; then
    echo "❌ Error: No signature found in report"
    exit 1
fi

# Compute hash without signature field
# IMPORTANT: Use --compact-output --sort-keys to match Swift JSONEncoder
COMPUTED=$(jq --compact-output --sort-keys 'del(.signature)' report.json | shasum -a 256 | cut -d' ' -f1)

echo "Expected:  $SIGNATURE"
echo "Computed:  $COMPUTED"
echo ""

if [ "$SIGNATURE" = "$COMPUTED" ]; then
    echo "✅ Signature valid - Report is authentic and has not been tampered"
    exit 0
else
    echo "❌ Signature invalid - Report may have been modified"
    exit 1
fi
