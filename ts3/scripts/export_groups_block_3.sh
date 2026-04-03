#!/usr/bin/env bash
set -euo pipefail

OUTPUT_FILE="${1:-$HOME/ts3-block-3-groups.txt}"

{
  echo "===== SGID 17 - EK ====="
  servergrouppermlist sgid=17
  echo
  echo "===== SGID 19 - ED ====="
  servergrouppermlist sgid=19
  echo
  echo "===== SGID 18 - RP ====="
  servergrouppermlist sgid=18
  echo
  echo "===== SGID 20 - MS ====="
  servergrouppermlist sgid=20
  echo
  echo "===== SGID 21 - EM ====="
  servergrouppermlist sgid=21
} > "$OUTPUT_FILE"

echo "Export concluído em: $OUTPUT_FILE"
