#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$ROOT_DIR/config/provision.conf"

ENV_FILE="$ROOT_DIR/env/.env"
if [ -f "$ENV_FILE" ]; then
  source "$ENV_FILE"
fi

echo "======================================="
echo " Applying FULL TS3 Template"
echo "======================================="

QUERY_HOST="${TS3_QUERY_HOST:-127.0.0.1}"
QUERY_PORT="${TS3_QUERY_PORT:-10011}"
QUERY_USER="${TS3_QUERY_USER:-serveradmin}"

if [ -z "${TS3_QUERY_PASSWORD:-}" ]; then
  echo "TS3_QUERY_PASSWORD não definido no .env"
  exit 1
fi

execute_query() {
  printf "login %s %s\nuse sid=1\n%s\nquit\n" \
    "$QUERY_USER" \
    "$TS3_QUERY_PASSWORD" \
    "$1" | nc "$QUERY_HOST" "$QUERY_PORT"
}

# ===========================
# 1. Criar Grupos
# ===========================

echo "Creating groups..."

while IFS= read -r line; do
  if [[ -n "$line" ]]; then
    execute_query "$line" || true
  fi
done < "$ROOT_DIR/ts3/scripts/create_groups_query.txt"

# ===========================
# 2. Aplicar Permissões de Grupos
# ===========================

echo "Applying group permissions..."

apply_group_perms() {
  GROUP_NAME="$1"
  PERM_FILE="$2"

  SGID=$(printf "login %s %s\nuse sid=1\nservergrouplist\nquit\n" \
    "$QUERY_USER" "$TS3_QUERY_PASSWORD" | nc "$QUERY_HOST" "$QUERY_PORT" | \
    grep "name=$GROUP_NAME" | sed -n 's/.*sgid=\([0-9]*\).*/\1/p')

  if [ -z "$SGID" ]; then
    echo "Grupo $GROUP_NAME não encontrado."
    return
  fi

  while IFS= read -r perm; do
    if [[ -n "$perm" ]]; then
      execute_query "servergroupaddperm sgid=$SGID $perm" || true
    fi
  done < "$PERM_FILE"
}

apply_group_perms "Bot Admin" "$ROOT_DIR/ts3/groups/template/perms-bot-admin.txt"
apply_group_perms "Bot Moderator" "$ROOT_DIR/ts3/groups/template/perms-bot-moderator.txt"
apply_group_perms "Registrada" "$ROOT_DIR/ts3/groups/template/perms-registrada.txt"
apply_group_perms "Registrado" "$ROOT_DIR/ts3/groups/template/perms-registrado.txt"
apply_group_perms "Sem Descricao" "$ROOT_DIR/ts3/groups/template/perms-sem-descricao.txt"
apply_group_perms "Movedor" "$ROOT_DIR/ts3/groups/template/perms-movedor.txt"
apply_group_perms "Server Admin" "$ROOT_DIR/ts3/groups/template/perms-server-admin.txt"
apply_group_perms "Invisível" "$ROOT_DIR/ts3/groups/template/perms-invisivel.txt"

# ===========================
# 3. Criar Canais
# ===========================

echo "Creating channels..."

while IFS= read -r line; do
  if [[ -n "$line" ]]; then
    execute_query "$line" || true
  fi
done < "$ROOT_DIR/ts3/scripts/create_channels_query.txt"

while IFS= read -r line; do
  if [[ -n "$line" ]]; then
    execute_query "$line" || true
  fi
done < "$ROOT_DIR/ts3/scripts/create_neutrals_pages_query.txt"

echo "======================================="
echo " TS3 FULL Template Applied"
echo "======================================="
