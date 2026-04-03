#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib.sh"

ROOT_DIR="$(repo_root)"

print_header "Etapa 06 - Serviços systemd"

require_root_or_sudo

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

print_header "Serviços systemd configurados"
