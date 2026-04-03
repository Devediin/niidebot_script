#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

BOT_USER="uai_coins"
BOT_DIR="/home/${BOT_USER}/tibia-ts3-teamspeakbot"
BOT_REPO="git@github.com:Devediin/tsbot.git"

echo "=================================================="
echo " Etapa 05 - Instalação do bot"
echo "=================================================="

if ! id -u "$BOT_USER" >/dev/null 2>&1; then
  echo "Usuário $BOT_USER não existe. Crie o usuário antes de continuar."
  exit 1
fi

if [ ! -d "$BOT_DIR/.git" ]; then
  sudo -u "$BOT_USER" git clone "$BOT_REPO" "$BOT_DIR"
else
  echo "Repositório já existe em $BOT_DIR. Atualizando..."
  sudo -u "$BOT_USER" bash -c "cd '$BOT_DIR' && git pull"
fi

sudo chown -R "$BOT_USER:$BOT_USER" "$BOT_DIR"

if [ -f "$BOT_DIR/package.json" ]; then
  sudo -u "$BOT_USER" bash -c "cd '$BOT_DIR' && yarn install"
else
  echo "package.json não encontrado em $BOT_DIR"
  exit 1
fi

if [ ! -f "$BOT_DIR/.env" ]; then
  if [ -f "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/env/.env.example" ]; then
    sudo cp "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/env/.env.example" "$BOT_DIR/.env"
    sudo chown "$BOT_USER:$BOT_USER" "$BOT_DIR/.env"
    echo "Arquivo .env criado a partir de env/.env.example"
    echo "IMPORTANTE: edite o .env antes de subir o serviço em produção."
  else
    echo "Arquivo env/.env.example ainda não existe no repositório."
    echo "Crie esse arquivo antes de usar em produção."
  fi
else
  echo ".env já existe em $BOT_DIR. Mantendo arquivo atual."
fi

echo "=================================================="
echo " Bot instalado/configurado"
echo "=================================================="
