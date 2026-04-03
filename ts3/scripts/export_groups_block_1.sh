#!/usr/bin/env bash
set -euo pipefail

OUTPUT_FILE="${1:-$HOME/ts3-block-1-groups.txt}"

{
  echo "===== SGID 60 - Invisível ====="
  servergrouppermlist sgid=60
  echo
  echo "===== SGID 6 - Leader ====="
  servergrouppermlist sgid=6
  echo
  echo "===== SGID 57 - Server Admin ====="
  servergrouppermlist sgid=57
  echo
  echo "===== SGID 61 - Movedor ====="
  servergrouppermlist sgid=61
  echo
  echo "===== SGID 62 - Registrada ====="
  servergrouppermlist sgid=62
  echo
  echo "===== SGID 7 - Registrado ====="
  servergrouppermlist sgid=7
  echo
  echo "===== SGID 56 - Sem Descricao ====="
  servergrouppermlist sgid=56
  echo
  echo "===== SGID 8 - Spy ====="
  servergrouppermlist sgid=8
} > "$OUTPUT_FILE"

echo "Export concluído em: $OUTPUT_FILE"
