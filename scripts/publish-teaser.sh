#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
REPORT_SRC="${REPORT_SRC:-$HOME/Desktop/Workspace/business-models/reports/W202628_analysis_report_teaser.html}"
PERIOD="${1:?Usage: publish-teaser.sh <period>   e.g. june-2026}"
OUT_NAME="funding-map-${PERIOD}-teaser.html"
OUT_PATH="$ROOT/$OUT_NAME"

if [[ ! -f "$REPORT_SRC" ]]; then
  echo "Teaser report not found: $REPORT_SRC" >&2
  exit 1
fi

cp "$REPORT_SRC" "$OUT_PATH"

echo "Wrote $OUT_NAME"
echo "URL: https://assets.twoexitslater.com/$OUT_NAME"
