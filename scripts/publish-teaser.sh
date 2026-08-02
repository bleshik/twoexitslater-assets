#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PERIOD="${1:?Usage: publish-teaser.sh <period>   e.g. june-2026}"

MONTH_NAME="${PERIOD%-*}"
YEAR="${PERIOD##*-}"
case "$MONTH_NAME" in
  january) MONTH="01" ;;
  february) MONTH="02" ;;
  march) MONTH="03" ;;
  april) MONTH="04" ;;
  may) MONTH="05" ;;
  june) MONTH="06" ;;
  july) MONTH="07" ;;
  august) MONTH="08" ;;
  september) MONTH="09" ;;
  october) MONTH="10" ;;
  november) MONTH="11" ;;
  december) MONTH="12" ;;
  *) echo "Unsupported period: $PERIOD (expected e.g. july-2026)" >&2; exit 1 ;;
esac

REPORT_SRC="${REPORT_SRC:-$HOME/Desktop/Workspace/business-models/reports/funding_map_${YEAR}_${MONTH}_teaser.html}"
OUT_NAME="funding-map-${PERIOD}-teaser.html"
OUT_PATH="$ROOT/$OUT_NAME"
LATEST_NAME="funding-map.html"
LATEST_PATH="$ROOT/$LATEST_NAME"

if [[ ! -f "$REPORT_SRC" ]]; then
  echo "Teaser report not found: $REPORT_SRC" >&2
  exit 1
fi

cp "$REPORT_SRC" "$OUT_PATH"
cp "$REPORT_SRC" "$LATEST_PATH"

echo "Wrote $OUT_NAME"
echo "URL: https://assets.twoexitslater.com/$OUT_NAME"
echo "Updated $LATEST_NAME"
echo "Stable URL: https://assets.twoexitslater.com/$LATEST_NAME"
