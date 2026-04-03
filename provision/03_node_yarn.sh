#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib.sh"

export DEBIAN_FRONTEND=noninteractive

print_header "Etapa 03 - Node.js e Yarn"

require_root_or_sudo

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

print_header "Node.js e Yarn instalados com sucesso"
