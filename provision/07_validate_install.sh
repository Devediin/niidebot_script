#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib.sh"

print_header "Etapa 07 - Validação do ambiente"

echo "Usuário configurado: $APP_USER"
echo "Home configurada: $APP_HOME"
echo "Bot dir: $BOT_DIR"
echo "TS3 dir: $TS3_INSTALL_DIR"
echo

echo "Verificando binários..."
command -v git >/dev/null 2>&1 && echo "OK - git" || echo "ERRO - git"
command -v node >/dev/null 2>&1 && echo "OK - node" || echo "ERRO - node"
command -v npm >/dev/null 2>&1 && echo "OK - npm" || echo "ERRO - npm"
command -v yarn >/dev/null 2>&1 && echo "OK - yarn" || echo "ERRO - yarn"
command -v mongod >/dev/null 2>&1 && echo "OK - mongod" || echo "ERRO - mongod"
echo

echo "Verificando diretórios..."
[ -d "$BOT_DIR" ] && echo "OK - BOT_DIR existe" || echo "ERRO - BOT_DIR não existe"
[ -d "$TS3_INSTALL_DIR" ] && echo "OK - TS3_INSTALL_DIR existe" || echo "ERRO - TS3_INSTALL_DIR não existe"
echo

echo "Verificando serviços..."
systemctl list-unit-files | grep -q "^mongod" && echo "OK - mongod registrado" || echo "ERRO - mongod não registrado"
systemctl list-unit-files | grep -q "^ts3server.service" && echo "OK - ts3server.service registrado" || echo "ERRO - ts3server.service não registrado"
systemctl list-unit-files | grep -q "^tibia-ts3-bot.service" && echo "OK - tibia-ts3-bot.service registrado" || echo "ERRO - tibia-ts3-bot.service não registrado"
echo

echo "Status resumido:"
sudo systemctl is-active mongod || true
sudo systemctl is-active ts3server.service || true
sudo systemctl is-active tibia-ts3-bot.service || true
echo

print_header "Validação concluída"
