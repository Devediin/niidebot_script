#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib.sh"

print_header "Etapa 06 - Serviços systemd"

require_root_or_sudo
require_user_exists "$APP_USER"

# ===========================
# TS3 SERVICE
# ===========================

sudo tee /etc/systemd/system/ts3server.service >/dev/null <<EOF
[Unit]
Description=TeamSpeak 3 Server
After=network.target

[Service]
Type=forking
User=${APP_USER}
WorkingDirectory=${TS3_INSTALL_DIR}
ExecStart=${TS3_INSTALL_DIR}/ts3server_startscript.sh start
ExecStop=${TS3_INSTALL_DIR}/ts3server_startscript.sh stop
ExecReload=${TS3_INSTALL_DIR}/ts3server_startscript.sh restart
PIDFile=${TS3_INSTALL_DIR}/ts3server.pid
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

# ===========================
# BOT SERVICE
# ===========================

if [ ! -d "$BOT_DIR" ]; then
  echo "BOT_DIR não encontrado: $BOT_DIR"
  exit 1
fi

sudo tee /etc/systemd/system/tibia-ts3-bot.service >/dev/null <<EOF
[Unit]
Description=Tibia TS3 Bot
After=network.target mongod.service ts3server.service
Wants=mongod.service
Requires=ts3server.service

[Service]
Type=simple
User=${APP_USER}
WorkingDirectory=${BOT_DIR}
ExecStart=/usr/bin/yarn start
Restart=always
RestartSec=5
Environment=NODE_ENV=production

[Install]
WantedBy=multi-user.target
EOF

# ===========================
# APPLY
# ===========================

sudo systemctl daemon-reload
sudo systemctl enable ts3server.service
sudo systemctl enable tibia-ts3-bot.service

sudo systemctl restart ts3server.service || true
sudo systemctl restart tibia-ts3-bot.service || true

echo
echo "Status TS3:"
sudo systemctl --no-pager --full status ts3server.service || true

echo
echo "Status Bot:"
sudo systemctl --no-pager --full status tibia-ts3-bot.service || true

print_header "Serviços systemd configurados"
