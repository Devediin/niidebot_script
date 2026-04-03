#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "=================================================="
echo " NiideBot VPS Provision - Full Install"
echo "=================================================="
echo

run_if_exists() {
  local script="$1"

  if [ -f "$ROOT_DIR/$script" ]; then
    echo ">>> Executando: $script"
    bash "$ROOT_DIR/$script"
    echo ">>> Finalizado: $script"
    echo
  else
    echo ">>> Pulando: $script (arquivo ainda não existe)"
    echo
  fi
}

run_if_exists "provision/09_create_app_user.sh"
run_if_exists "provision/13_backup_structure.sh"
run_if_exists "provision/01_system_base.sh"
run_if_exists "provision/02_mongodb.sh"
run_if_exists "provision/11_mongo_restore.sh"
run_if_exists "provision/03_node_yarn.sh"
run_if_exists "provision/12_bot_access_check.sh"
run_if_exists "provision/04_teamspeak_install.sh"
run_if_exists "provision/05_bot_install.sh"
run_if_exists "provision/06_systemd_services.sh"
run_if_exists "provision/10_firewall.sh"
run_if_exists "provision/07_validate_install.sh"
run_if_exists "provision/08_show_next_steps.sh"

echo "=================================================="
echo " Provisionamento finalizado"
echo "=================================================="
