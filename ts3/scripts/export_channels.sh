#!/usr/bin/env bash
set -euo pipefail

OUTPUT_FILE="${1:-$HOME/ts3-channels.txt}"

{
  echo "===== CHANNEL LIST ====="
  channellist -topic -flags -voice -limits -icon -secondsempty
  echo
  echo "===== CHANNEL PERMISSIONS ====="
  channelgrouplist
} > "$OUTPUT_FILE"

echo "Export concluído em: $OUTPUT_FILE"
