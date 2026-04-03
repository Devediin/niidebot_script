#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib.sh"

print_header "Etapa 09 - Criar usuário da aplicação"

require_root_or_sudo

if id -u "$APP_USER" >/dev/null 2>&1; then
  echo "Usuário $APP_USER já existe. Pulando criação."
else
  sudo adduser --disabled-password --gecos "" "$APP_USER"
  echo "Usuário $APP_USER criado com sucesso."
fi

if [ ! -d "$APP_HOME" ]; then
  sudo mkdir -p "$APP_HOME"
  sudo chown -R "$APP_USER:$APP_USER" "$APP_HOME"
fi

print_header "Usuário da aplicação validado"
