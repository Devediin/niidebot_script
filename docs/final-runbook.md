# Final Runbook

Guia prático final para subir uma nova instância da VPS com NiideBot + TeamSpeak 3.

## Objetivo

Usar este repositório como base para provisionar uma nova VPS com:

- sistema base
- MongoDB
- Node.js / Yarn
- TeamSpeak 3
- bot
- serviços systemd
- estrutura base do TS3 documentada

## O que já está pronto

### Provisionamento
- criação do usuário da aplicação
- instalação de pacotes base
- instalação do MongoDB
- instalação do Node.js e Yarn
- instalação do TeamSpeak 3
- clone do bot
- criação dos serviços systemd
- firewall
- validação inicial

### TS3
- grupos mapeados
- canais mapeados
- ordem visual documentada
- perfis de permissões documentados

## O que ainda é parcial/manual

### TS3
A recriação completa do TS3 ainda não está em modo 100% automático.

Já existe:
- plano de grupos
- plano de canais
- arquivos de permissões
- sequência lógica

Mas ainda depende de aplicação guiada/manual ou automação posterior via ServerQuery.

## Fluxo recomendado de uso

### 1. Clonar repositório na VPS nova


git clone https://github.com/Devediin/niidebot_script.git
cd niidebot_script
2. Criar configuração local
Bash

cp config/provision.conf.example config/provision.conf
nano config/provision.conf
Ajustar:

APP_USER
APP_HOME
BOT_DIR
TS3_BASE_DIR
TS3_INSTALL_DIR
3. Rodar preparação
Bash

bash provision/00_prepare.sh
4. Rodar instalação
Bash

bash install.sh
5. Validar ambiente
Bash

bash provision/07_validate_install.sh
6. Revisar .env do bot
Bash

nano /home/SEU_USUARIO/tibia-ts3-teamspeakbot/.env
Definir principalmente:

WORLD_NAME
credenciais do TS3
credenciais e URI do Mongo
variáveis adicionais exigidas pelo bot
7. Verificar serviços
Bash

sudo systemctl status mongod
sudo systemctl status ts3server.service
sudo systemctl status tibia-ts3-bot.service
Fluxo recomendado para TS3
Grupos
Consultar:

ts3/scripts/create_groups_query.txt
ts3/groups/template/
Canais
Consultar:

ts3/scripts/create_channels_query.txt
ts3/scripts/create_neutrals_pages_query.txt
ts3/channels/template/
Ordem de referência
Consultar:

ts3/channels/template/channel-structure.md
docs/ts3-install-sequence.md
Regra principal entre instâncias
O que deve mudar entre mundos/instâncias é principalmente o .env, especialmente:

env

WORLD_NAME=...
A estrutura esperada do TS3 deve permanecer equivalente.

Observações importantes
não usar os IDs antigos do servidor atual como dependência
na nova instância, os grupos e canais terão novos IDs
grupos nativos/default do TS3 não devem ser recriados à força
Spy é grupo padrão do TS3
Leader corresponde ao grupo admin padrão/original do TS3
Estado atual do projeto
Este repositório já está apto para:

provisionamento inicial da VPS
organização do template
documentação de recriação do TS3
Ainda será desejável futuramente:

automação total via ServerQuery
aplicação automática de grupos/permissões/canais
restore mais inteligente de backups
tratamento mais completo de clone privado do bot
