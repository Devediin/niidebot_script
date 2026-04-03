#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib.sh"

export DEBIAN_FRONTEND=noninteractive

print_header "Etapa 01 - Sistema base"

require_root_or_sudo

sudo apt update
sudo apt upgrade -y

sudo apt install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  wget \
  gnupg \
  lsb-release \
  software-properties-common \
  git \
  unzip \
  zip \
  tar \
  xz-utils \
  nano \
  vim \
  jq \
  build-essential \
  pkg-config \
  python3 \
  python3-pip \
  openssl \
  libssl-dev \
  libncurses5 \
  libmariadb-dev \
  rsync \
  cron \
  ufw

print_header "Sistema base instalado com sucesso"
