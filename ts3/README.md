# TS3 Template

Esta pasta contém os arquivos relacionados ao template do TeamSpeak 3.

## Objetivo

Permitir recriar em novas instâncias a mesma estrutura usada no ambiente atual:

- grupos
- permissões
- canais
- ordem lógica

## Estrutura


ts3/
├── README.md
├── groups/
│   ├── raw/
│   └── template/
├── channels/
│   └── raw/
└── scripts/
Convenção
raw/
Arquivos exportados diretamente do servidor atual, sem tratamento.

template/
Arquivos já tratados para uso em automação.

scripts/
Scripts que futuramente vão aplicar a estrutura do TS3 na nova instância.

Observação importante
No servidor atual:

não apagar grupos
não recriar grupos
não alterar IDs existentes
Na nova instância:

a estrutura pode ser recriada do zero
os IDs não precisam ser iguais aos atuais
o importante é manter equivalência funcional



---
