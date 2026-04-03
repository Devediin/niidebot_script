#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "=================================================="
echo " Etapa 06 - Serviços systemd"
echo "=================================================="

if [ -f "$ROOT_DIR/systemd/ts3server.service" ]; then
  sudo cp "$ROOT_DIR/systemd/ts3server.service" /etc/systemd/system/ts3server.service
  echo "Serviço ts3server.service copiado."
else
  echo "Arquivo systemd/ts3server.service não encontrado."
fi

if [ -f "$ROOT_DIR/systemd/tibia-ts3-bot.service" ]; then
  sudo cp "$ROOT_DIR/systemd/tibia-ts3-bot.service" /etc/systemd/system/tibia-ts3-bot.service
  echo "Serviço tibia-ts3-bot.service copiado."
else
  echo "Arquivo systemd/tibia-ts3-bot.service não encontrado."
fi

sudo systemctl daemon-reload

if [ -f /etc/systemd/system/ts3server.service ]; then
  sudo systemctl enable ts3server.service
  sudo systemctl restart ts3server.service || true
fi

if [ -f /etc/systemd/system/tibia-ts3-bot.service ]; then
  sudo systemctl enable tibia-ts3-bot.service
  sudo systemctl restart tibia-ts3-bot.service || true
fi

echo
echo "Status TS3:"
sudo systemctl --no-pager --full status ts3server.service || true

echo
echo "Status Bot:"
sudo systemctl --no-pager --full status tibia-ts3-bot.service || true

echo "=================================================="
echo " Serviços systemd configurados"
echo "=================================================="
