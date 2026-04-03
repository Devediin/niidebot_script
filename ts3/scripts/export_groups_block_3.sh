#!/usr/bin/env bash
set -euo pipefail

OUTPUT_FILE="${1:-$HOME/ts3-block-3-groups.txt}"

{
  echo "===== SGID 17 ====="
  servergrouppermlist sgid=17
  echo
  echo "===== SGID 19 ====="
  servergrouppermlist sgid=19
  echo
  echo "===== SGID 18 ====="
  servergrouppermlist sgid=18
  echo
  echo "===== SGID 20 ====="
  servergrouppermlist sgid=20
  echo
  echo "===== SGID 21 ====="
  servergrouppermlist sgid=21
} > "$OUTPUT_FILE"

echo "Export concluído em: $OUTPUT_FILE"
