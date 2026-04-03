#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib.sh"

print_header "Etapa 13 - Estrutura de backup"

ROOT_DIR="$(repo_root)"

mkdir -p "$ROOT_DIR/backup"
mkdir -p "$ROOT_DIR/backup/mongo"
mkdir -p "$ROOT_DIR/backup/ts3"
mkdir -p "$ROOT_DIR/backup/bot"

echo "Estrutura criada:"
echo "- $ROOT_DIR/backup"
echo "- $ROOT_DIR/backup/mongo"
echo "- $ROOT_DIR/backup/ts3"
echo "- $ROOT_DIR/backup/bot"

print_header "Estrutura de backup preparada"
