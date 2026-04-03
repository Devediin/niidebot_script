#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_FILE="${ROOT_DIR}/config/provision.conf"

if [ ! -f "$CONFIG_FILE" ]; then
  echo "Arquivo de configuração não encontrado: $CONFIG_FILE"
  exit 1
fi

# shellcheck disable=SC1090
source "$CONFIG_FILE"

require_root_or_sudo() {
  if ! command -v sudo >/dev/null 2>&1; then
    echo "sudo não encontrado. Instale sudo antes de continuar."
    exit 1
  fi
}

require_user_exists() {
  local user_name="$1"
  if ! id -u "$user_name" >/dev/null 2>&1; then
    echo "Usuário não encontrado: $user_name"
    exit 1
  fi
}

print_header() {
  local title="$1"
  echo "=================================================="
  echo " $title"
  echo "=================================================="
}

repo_root() {
  echo "$ROOT_DIR"
}
