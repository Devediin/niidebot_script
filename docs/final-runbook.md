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

```bash
git clone https://github.com/Devediin/niidebot_script.git
cd niidebot_script
