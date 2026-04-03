# Provisioning

Este documento descreve a estratégia de provisionamento da VPS do NiideBot + TeamSpeak 3.

## Objetivo

Subir uma nova instância de VPS com comportamento igual ao ambiente atual, deixando pronto:

- sistema base
- dependências
- MongoDB
- Node.js / Yarn
- TeamSpeak 3
- bot
- serviços systemd
- estrutura padrão do TS3

## Princípio de repetibilidade

A nova instância deve ser reproduzível.

O projeto precisa permitir que o processo seja executado novamente em novas VPS sem reconstruir tudo manualmente.

## Fonte da verdade

A fonte principal do template será este repositório:

```bash
https://github.com/Devediin/niidebot_script
