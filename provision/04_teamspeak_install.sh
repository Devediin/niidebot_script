#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

TS3_VERSION="3.13.7"
TS3_ARCHIVE="teamspeak3-server_linux_amd64-${TS3_VERSION}.tar.bz2"
TS3_URL="https://files.teamspeak-services.com/releases/server/${TS3_VERSION}/${TS3_ARCHIVE}"

TS3_BASE_DIR="/home/uai_coins/ts3"
TS3_INSTALL_DIR="${TS3_BASE_DIR}/teamspeak3-server_linux_amd64"
TS3_USER="uai_coins"

echo "=================================================="
echo " Etapa 04 - TeamSpeak 3"
echo "=================================================="

if ! id -u "$TS3_USER" >/dev/null 2>&1; then
  echo "Usuário $TS3_USER não existe. Crie o usuário antes de continuar."
  exit 1
fi

sudo mkdir -p "$TS3_BASE_DIR"
sudo chown -R "$TS3_USER:$TS3_USER" "$TS3_BASE_DIR"

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

sudo chown -R "$TS3_USER:$TS3_USER" "$TS3_INSTALL_DIR"

if [ ! -f "${TS3_INSTALL_DIR}/.ts3server_license_accepted" ]; then
  sudo -u "$TS3_USER" touch "${TS3_INSTALL_DIR}/.ts3server_license_accepted"
fi

echo "=================================================="
echo " TeamSpeak 3 instalado com sucesso"
echo "=================================================="
