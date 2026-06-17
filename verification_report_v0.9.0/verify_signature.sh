#!/bin/bash
# Master Copy Report Integrity Check (checksum)
# Verifies that report.json still matches its recorded SHA-256 checksum.
# NOTE: this is a corruption check, NOT a cryptographic signature — it cannot
# prove the issuer did not edit the file (anyone can recompute the hash).
# The real independent anchors are the public GitHub Actions log + reproducible seed.

echo "🔍 Verifying report integrity (checksum)..."
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
    echo "❌ Error: No checksum found in report"
    exit 1
fi

# Compute hash without signature field
# IMPORTANT: Use --compact-output --sort-keys to match Swift JSONEncoder
COMPUTED=$(jq --compact-output --sort-keys 'del(.signature)' report.json | shasum -a 256 | cut -d' ' -f1)

echo "Expected:  $SIGNATURE"
echo "Computed:  $COMPUTED"
echo ""

if [ "$SIGNATURE" = "$COMPUTED" ]; then
    echo "✅ Integrity OK — report.json matches its recorded checksum (corruption check passed)"
    exit 0
else
    echo "❌ Integrity check failed — report.json does not match its recorded checksum"
    exit 1
fi
