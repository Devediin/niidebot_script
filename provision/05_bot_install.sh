#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib.sh"

print_header "Etapa 05 - Instalação do bot"

require_root_or_sudo
require_user_exists "$APP_USER"

BOT_DIR="$APP_HOME/tsbot"
BOT_REPO="https://github.com/Devediin/tsbot.git"

if [ ! -d "$BOT_DIR/.git" ]; then
  sudo -u "$APP_USER" git clone "$BOT_REPO" "$BOT_DIR"
else
  echo "Repositório já existe em $BOT_DIR. Atualizando..."
  sudo -u "$APP_USER" bash -c "cd '$BOT_DIR' && git pull"
fi

sudo chown -R "$APP_USER:$APP_USER" "$BOT_DIR"

if [ -f "$BOT_DIR/package.json" ]; then
  sudo -u "$APP_USER" bash -c "cd '$BOT_DIR' && yarn install"
else
  echo "package.json não encontrado em $BOT_DIR"
  exit 1
fi

if [ ! -f "$BOT_DIR/.env" ]; then
  sudo cp "$ROOT_DIR/env/.env.example" "$BOT_DIR/.env"
  sudo chown "$APP_USER:$APP_USER" "$BOT_DIR/.env"
  echo "Arquivo .env criado. Ajuste antes de usar em produção."
fi

print_header "Bot instalado com sucesso"
