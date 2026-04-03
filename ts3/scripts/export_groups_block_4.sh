#!/usr/bin/env bash
set -euo pipefail

OUTPUT_FILE="${1:-$HOME/ts3-block-4-groups.txt}"

{
  echo "===== SGID 22 ====="
  servergrouppermlist sgid=22
  echo
  echo "===== SGID 23 ====="
  servergrouppermlist sgid=23
} > "$OUTPUT_FILE"

echo "Export concluído em: $OUTPUT_FILE"
