#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "=================================================="
echo " Etapa 00 - Preparação"
echo "=================================================="

find "$ROOT_DIR/provision" -type f -name "*.sh" -exec chmod +x {} \;

echo "Scripts em provision/ marcados como executáveis."
echo "Se necessário, revise config/provision.conf antes de continuar."

echo "=================================================="
echo " Preparação concluída"
echo "=================================================="
