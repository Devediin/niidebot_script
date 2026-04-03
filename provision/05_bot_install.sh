#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib.sh"

export DEBIAN_FRONTEND=noninteractive

ROOT_DIR="$(repo_root)"

print_header "Etapa 05 - Instalação do bot"

require_root_or_sudo
require_user_exists "$APP_USER"

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
  if [ -f "$ROOT_DIR/env/.env.example" ]; then
    sudo cp "$ROOT_DIR/env/.env.example" "$BOT_DIR/.env"
    sudo chown "$APP_USER:$APP_USER" "$BOT_DIR/.env"
    echo "Arquivo .env criado a partir de env/.env.example"
    echo "IMPORTANTE: edite o .env antes de subir o serviço em produção."
  else
    echo "Arquivo env/.env.example ainda não existe no repositório."
    echo "Crie esse arquivo antes de usar em produção."
  fi
else
  echo ".env já existe em $BOT_DIR. Mantendo arquivo atual."
fi

print_header "Bot instalado/configurado"
