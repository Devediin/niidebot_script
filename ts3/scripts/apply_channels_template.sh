#!/usr/bin/env bash
set -euo pipefail

echo "=================================================="
echo " TS3 - Apply Channels Template"
echo "=================================================="
echo
echo "Etapas planejadas:"
echo "1. criar canais na ordem correta"
echo "2. localizar CIDs novos"
echo "3. criar páginas filhas de Neutrals"
echo "4. aplicar permissões por perfil"
echo
echo "Arquivos base:"
echo "- ts3/scripts/create_channels_query.txt"
echo "- ts3/scripts/create_neutrals_pages_query.txt"
echo "- ts3/channels/template/perms-channel-bot-main.txt"
echo "- ts3/channels/template/perms-channel-bot-page.txt"
echo "- ts3/channels/template/perms-channel-voice.txt"
echo "- ts3/channels/template/perms-channel-afk.txt"
echo
echo "Observação:"
echo "- os nomes dinâmicos com contadores não devem ser fixados no template"
echo "- o bot deve atualizar nomes e descrições após a criação da estrutura"
echo
echo "Status: placeholder operacional/documental"
