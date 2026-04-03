#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib.sh"

print_header "Etapa 10 - Firewall"

require_root_or_sudo

sudo ufw allow OpenSSH || true
sudo ufw allow 9987/udp || true
sudo ufw allow 10011/tcp || true
sudo ufw allow 30033/tcp || true

sudo ufw --force enable
sudo ufw status verbose || true

print_header "Firewall configurado"
