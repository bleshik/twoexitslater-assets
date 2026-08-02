#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PERIOD="${1:?Usage: publish-vault.sh <period> [suffix]   e.g. june-2026 x7k2}"

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

REPORT_SRC="${REPORT_SRC:-$HOME/Desktop/Workspace/business-models/reports/funding_map_${YEAR}_${MONTH}.html}"
SUFFIX="${2:-$(LC_ALL=C tr -dc 'a-z0-9' </dev/urandom | head -c 4)}"
OUT_NAME="funding-map-${PERIOD}-${SUFFIX}.html"
OUT_PATH="$ROOT/vault/$OUT_NAME"
LATEST_NAME="funding-map.html"
LATEST_PATH="$ROOT/vault/$LATEST_NAME"

if [[ ! -f "$REPORT_SRC" ]]; then
  echo "Report not found: $REPORT_SRC" >&2
  exit 1
fi

mkdir -p "$ROOT/vault"
cp "$REPORT_SRC" "$OUT_PATH"
cp "$REPORT_SRC" "$LATEST_PATH"

for REPORT_PATH in "$OUT_PATH" "$LATEST_PATH"; do
  if ! grep -q 'noindex' "$REPORT_PATH"; then
    sed -i '' 's/<meta name="viewport"/<meta name="robots" content="noindex, nofollow">\
  <meta name="viewport"/' "$REPORT_PATH"
  fi
done

VAULT_URL="https://assets.twoexitslater.com/vault/$OUT_NAME"
LATEST_URL="https://assets.twoexitslater.com/vault/$LATEST_NAME"

echo "Wrote vault/$OUT_NAME"
echo "URL: $VAULT_URL"
echo "Updated vault/$LATEST_NAME"
echo "Stable subscriber URL: $LATEST_URL"
