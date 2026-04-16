#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Carrega config principal
source "$ROOT_DIR/config/provision.conf"

# Carrega .env
ENV_FILE="$ROOT_DIR/env/.env"
if [ -f "$ENV_FILE" ]; then
  source "$ENV_FILE"
fi

echo "======================================="
echo " Applying TS3 Template"
echo "======================================="

if [ -z "${TS3_QUERY_PASSWORD:-}" ]; then
  echo "TS3_QUERY_PASSWORD não definido no .env"
  exit 1
fi

QUERY_HOST="${TS3_QUERY_HOST:-127.0.0.1}"
QUERY_PORT="${TS3_QUERY_PORT:-10011}"
QUERY_USER="${TS3_QUERY_USER:-serveradmin}"

execute_query() {
  printf "login %s %s\nuse sid=1\n%s\nquit\n" \
    "$QUERY_USER" \
    "$TS3_QUERY_PASSWORD" \
    "$1" | nc "$QUERY_HOST" "$QUERY_PORT"
}

# ===========================
# Criar grupos
# ===========================

echo "Creating groups..."

while IFS= read -r line; do
  if [[ -n "$line" ]]; then
    execute_query "$line" || true
  fi
done < "$ROOT_DIR/ts3/scripts/create_groups_query.txt"

# ===========================
# Criar canais principais
# ===========================

echo "Creating channels..."

while IFS= read -r line; do
  if [[ -n "$line" ]]; then
    execute_query "$line" || true
  fi
done < "$ROOT_DIR/ts3/scripts/create_channels_query.txt"

# ===========================
# Criar páginas Neutrals
# ===========================

echo "Creating neutral pages..."

while IFS= read -r line; do
  if [[ -n "$line" ]]; then
    execute_query "$line" || true
  fi
done < "$ROOT_DIR/ts3/scripts/create_neutrals_pages_query.txt"

echo "======================================="
echo " TS3 Template Applied"
echo "======================================="
