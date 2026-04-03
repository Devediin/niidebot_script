# niidebot_script

Template de provisionamento para novas instâncias da VPS do NiideBot + TeamSpeak 3.

## Objetivo

Este repositório serve para subir uma nova VPS já pronta, replicando o ambiente atual com o mínimo de alteração manual.

A ideia é automatizar:

- instalação do sistema/base
- instalação de dependências
- instalação/configuração do MongoDB
- instalação/configuração do Node.js e Yarn
- instalação/configuração do TeamSpeak 3
- instalação/configuração do bot
- criação da estrutura do TS3
  - grupos
  - permissões
  - canais
  - ordem lógica
- criação de serviços systemd
- inicialização dos serviços

## Regra principal

As instâncias devem ficar o mais iguais possível.

O que muda entre uma instância e outra é principalmente o arquivo `.env`, especialmente:

```env
WORLD_NAME=...
