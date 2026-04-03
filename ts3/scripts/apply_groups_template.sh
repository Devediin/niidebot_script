#!/usr/bin/env bash
set -euo pipefail

echo "=================================================="
echo " TS3 - Apply Groups Template"
echo "=================================================="
echo
echo "Etapas planejadas:"
echo "1. criar grupos custom"
echo "2. capturar SGIDs novos"
echo "3. aplicar permissões equivalentes"
echo
echo "Arquivos base:"
echo "- ts3/scripts/create_groups_query.txt"
echo "- ts3/groups/template/perms-invisivel.txt"
echo "- ts3/groups/template/perms-server-admin.txt"
echo "- ts3/groups/template/perms-movedor.txt"
echo "- ts3/groups/template/perms-registrada.txt"
echo "- ts3/groups/template/perms-registrado.txt"
echo "- ts3/groups/template/perms-sem-descricao.txt"
echo "- ts3/groups/template/perms-bot-admin.txt"
echo "- ts3/groups/template/perms-bot-moderator.txt"
echo "- ts3/groups/template/perms-vocacao-base.txt"
echo
echo "Pendência atual:"
echo "- converter Leader integralmente"
echo "- definir template final dos grupos de level"
echo
echo "Status: placeholder operacional/documental"
