#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib.sh"

export DEBIAN_FRONTEND=noninteractive

TS3_ARCHIVE="teamspeak3-server_linux_amd64-${TS3_VERSION}.tar.bz2"
TS3_URL="https://files.teamspeak-services.com/releases/server/${TS3_VERSION}/${TS3_ARCHIVE}"

print_header "Etapa 04 - TeamSpeak 3"

require_root_or_sudo
require_user_exists "$APP_USER"

sudo mkdir -p "$TS3_BASE_DIR"
sudo chown -R "$APP_USER:$APP_USER" "$TS3_BASE_DIR"

if [ -d "$TS3_INSTALL_DIR" ]; then
  echo "Diretório do TS3 já existe em $TS3_INSTALL_DIR. Pulando extração."
else
  cd /tmp
  wget -O "$TS3_ARCHIVE" "$TS3_URL"
  tar -xjf "$TS3_ARCHIVE"
  rm -rf "$TS3_INSTALL_DIR"
  mv "teamspeak3-server_linux_amd64" "$TS3_INSTALL_DIR"
  rm -f "$TS3_ARCHIVE"
fi

sudo chown -R "$APP_USER:$APP_USER" "$TS3_INSTALL_DIR"

if [ ! -f "${TS3_INSTALL_DIR}/.ts3server_license_accepted" ]; then
  sudo -u "$APP_USER" touch "${TS3_INSTALL_DIR}/.ts3server_license_accepted"
fi

print_header "TeamSpeak 3 instalado com sucesso"
