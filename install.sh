#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=================================================="
echo " NiideBot Install Runner"
echo "=================================================="

if [ ! -f "$ROOT_DIR/config/provision.conf" ]; then
  echo "Arquivo ausente: config/provision.conf"
  echo
  echo "Crie com base em:"
  echo "config/provision.conf.example"
  exit 1
fi

bash "$ROOT_DIR/provision/00_prepare.sh"
bash "$ROOT_DIR/provision/99_full_install.sh"
