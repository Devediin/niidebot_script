#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

echo "=================================================="
echo " Etapa 02 - MongoDB"
echo "=================================================="

if command -v mongod >/dev/null 2>&1; then
  echo "MongoDB já está instalado. Pulando instalação."
else
  curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
    sudo gpg --dearmor -o /usr/share/keyrings/mongodb-server-7.0.gpg

  echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | \
    sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list >/dev/null

  sudo apt update
  sudo apt install -y mongodb-org
fi

sudo systemctl daemon-reload
sudo systemctl enable mongod
sudo systemctl restart mongod
sudo systemctl --no-pager --full status mongod || true

echo "=================================================="
echo " MongoDB instalado/configurado com sucesso"
echo "=================================================="
