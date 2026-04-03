#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib.sh"

print_header "Etapa 08 - Próximos passos"

cat <<EOF

Instalação base concluída.

Próximos passos recomendados:

1. Revisar o arquivo do bot:
   ${BOT_DIR}/.env

2. Confirmar se o MongoDB está ativo:
   sudo systemctl status mongod

3. Confirmar se o TeamSpeak 3 está ativo:
   sudo systemctl status ts3server.service

4. Confirmar se o bot está ativo:
   sudo systemctl status tibia-ts3-bot.service

5. Validar portas e firewall se necessário:
   - TS3 Voice: 9987/udp
   - TS3 ServerQuery: 10011/tcp
   - TS3 FileTransfer: 30033/tcp

6. Aplicar futuramente o template do TS3:
   - grupos
   - permissões
   - canais

EOF

print_header "Resumo final exibido"
