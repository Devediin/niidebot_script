#!/usr/bin/env bash
set -euo pipefail

OUTPUT_FILE="${1:-$HOME/ts3-block-2-groups.txt}"

{
  echo "===== SGID 16 ====="
  servergrouppermlist sgid=16
  echo
  echo "===== SGID 15 ====="
  servergrouppermlist sgid=15
} > "$OUTPUT_FILE"

echo "Export concluído em: $OUTPUT_FILE"
