#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
REPORT_SRC="${REPORT_SRC:-$HOME/Desktop/Workspace/business-models/reports/W202628_analysis_report.html}"
PERIOD="${1:?Usage: publish-vault.sh <period> [suffix]   e.g. june-2026 x7k2}"
SUFFIX="${2:-$(LC_ALL=C tr -dc 'a-z0-9' </dev/urandom | head -c 4)}"
OUT_NAME="funding-map-${PERIOD}-${SUFFIX}.html"
OUT_PATH="$ROOT/vault/$OUT_NAME"

if [[ ! -f "$REPORT_SRC" ]]; then
  echo "Report not found: $REPORT_SRC" >&2
  exit 1
fi

mkdir -p "$ROOT/vault"
cp "$REPORT_SRC" "$OUT_PATH"

if ! grep -q 'noindex' "$OUT_PATH"; then
  sed -i '' 's/<meta name="viewport"/<meta name="robots" content="noindex, nofollow">\
  <meta name="viewport"/' "$OUT_PATH"
fi

VAULT_URL="https://assets.twoexitslater.com/vault/$OUT_NAME"

echo "Wrote vault/$OUT_NAME"
echo "URL: $VAULT_URL"
echo ""
echo "Next: paste this URL into Beehiiv welcome email + newsletter footer"
