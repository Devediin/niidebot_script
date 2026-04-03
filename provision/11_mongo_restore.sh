#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib.sh"

print_header "Etapa 11 - Restore MongoDB"

require_root_or_sudo

BACKUP_DIR="$(repo_root)/backup/mongo"

if [ ! -d "$BACKUP_DIR" ]; then
  echo "Diretório de backup não encontrado: $BACKUP_DIR"
  echo "Pulando restore do MongoDB."
  exit 0
fi

if ! command -v mongorestore >/dev/null 2>&1; then
  echo "mongorestore não encontrado. Verifique instalação do MongoDB Database Tools."
  exit 1
fi

if [ -d "$BACKUP_DIR/$MONGO_DB_NAME" ]; then
  echo "Restaurando banco $MONGO_DB_NAME a partir de $BACKUP_DIR/$MONGO_DB_NAME"
  mongorestore --drop --db "$MONGO_DB_NAME" "$BACKUP_DIR/$MONGO_DB_NAME"
else
  echo "Pasta do banco não encontrada em $BACKUP_DIR/$MONGO_DB_NAME"
  echo "Estrutura esperada: backup/mongo/$MONGO_DB_NAME"
fi

print_header "Restore MongoDB finalizado"
