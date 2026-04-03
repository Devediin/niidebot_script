#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

echo "=================================================="
echo " Etapa 01 - Sistema base"
echo "=================================================="

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

echo "=================================================="
echo " Sistema base instalado com sucesso"
echo "=================================================="
