#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

echo "=================================================="
echo " Etapa 03 - Node.js e Yarn"
echo "=================================================="

if command -v node >/dev/null 2>&1; then
  echo "Node.js já instalado: $(node -v)"
else
  curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
  sudo apt update
  sudo apt install -y nodejs
fi

if command -v yarn >/dev/null 2>&1; then
  echo "Yarn já instalado: $(yarn -v)"
else
  sudo npm install -g yarn
fi

echo "Node.js version: $(node -v)"
echo "npm version: $(npm -v)"
echo "Yarn version: $(yarn -v)"

echo "=================================================="
echo " Node.js e Yarn instalados com sucesso"
echo "=================================================="
