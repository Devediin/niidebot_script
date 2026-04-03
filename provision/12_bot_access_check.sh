#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib.sh"

print_header "Etapa 12 - Verificação de acesso ao repositório do bot"

require_root_or_sudo
require_user_exists "$APP_USER"

echo "Repositório configurado:"
echo "$BOT_REPO"
echo

if [[ "$BOT_REPO" == git@github.com:* ]]; then
  echo "Clone via SSH detectado."
  echo "Verificando se o usuário $APP_USER possui diretório ~/.ssh ..."

  if sudo -u "$APP_USER" test -d "$APP_HOME/.ssh"; then
    echo "Diretório ~/.ssh encontrado para $APP_USER."
  else
    echo "Diretório ~/.ssh não encontrado para $APP_USER."
    echo "Se o repositório for privado, será necessário configurar chave SSH."
  fi

  echo
  echo "Teste rápido de acesso SSH ao GitHub:"
  sudo -u "$APP_USER" ssh -T git@github.com || true
else
  echo "Clone via HTTPS detectado ou URL não SSH."
  echo "Nenhuma validação SSH necessária."
fi

print_header "Verificação de acesso concluída"
