# TS3 Install Sequence

Sequência lógica para recriar a estrutura do TeamSpeak 3 em uma nova instância.

## 1. Instalar o TeamSpeak 3

Executar a instalação base do servidor TS3 e garantir que o serviço sobe corretamente.

## 2. Obter acesso ServerQuery

Usar:
- usuário `serveradmin`
- senha definida na instalação
- virtual server correto

## 3. Não mexer em grupos nativos

Grupos nativos/default do TS3 não devem ser apagados nem recriados à força.

Exemplos:
- grupo administrativo padrão inicial
- grupo Spy/default

## 4. Criar grupos custom

Criar os grupos custom do projeto:
- Invisível
- Server Admin
- Movedor
- Registrada
- Registrado
- Sem Descricao
- Bot Admin
- Bot Moderator
- EK
- ED
- RP
- MS
- EM
- -- LEVEL --

## 5. Aplicar permissões aos grupos custom

Aplicar as permissões mapeadas dos arquivos em:
- `ts3/groups/template/`

## 6. Criar canais base

Criar os canais top-level na ordem lógica prevista.

## 7. Criar canais filhos

Criar:
- páginas internas de Neutrals
- demais canais dependentes de pai

## 8. Aplicar permissões de canal

Aplicar perfis:
- bot main
- bot page
- voice
- afk

## 9. Deixar o bot atualizar conteúdo dinâmico

Nomes com contadores e descrições de listas devem ser atualizados pelo bot.

Exemplos:
- Enemys (...)
- Friends (...)
- Neutrals (...)
- Neutrals Page X

## 10. Validar estrutura final

Verificar:
- ordem visual
- permissões
- acesso aos canais
- funcionamento do bot
