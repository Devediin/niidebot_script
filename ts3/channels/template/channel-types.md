# Channel Types

Resumo dos tipos de canais identificados no TS3 atual.

## Tipo 1 - Estrutura visual / separadores

Exemplos:
- `[*cspacer]▂`
- `[*cspacer]▂▂`
- `[*cspacer]▂▂▂▂▂▂`
- `[*cspacer]▂▂▂▂▂▂▂`

Características:
- canais visuais
- permanentes
- usados para separar blocos
- normalmente com `channel_needed_subscribe_power=2`

## Tipo 2 - Canais informativos do bot

Exemplos:
- `[cspacer]Help channel`
- `[cspacer]Enemys (...)`
- `[cspacer]Friends (...)`
- `[cspacer]Neutrals (...)`

Características:
- permanentes
- descrição dinâmica atualizada pelo bot
- codec quality 5
- maxclients unlimited
- permissões específicas de leitura/entrada

Permissões observadas:
- `permid=86 permvalue=100`
- `permid=133 permvalue=100`
- `permid=140 permvalue=99`
- `permid=142 permvalue=0`
- `permid=144 permvalue=2`

## Tipo 3 - Páginas internas de listagem

Exemplos:
- `[cspacer]Neutrals Page 1`
- `[cspacer]Neutrals Page 2`
- ...
- `[cspacer]Neutrals Page 10`

Características:
- canais filhos de `Neutrals`
- permanentes
- descrição dinâmica
- codec quality 5
- maxclients unlimited

Permissões observadas:
- `permid=86 permvalue=100`
- `permid=133 permvalue=100`
- `permid=140 permvalue=99`
- `permid=142 permvalue=2`
- `permid=144 permvalue=2`

## Tipo 4 - Canais de voz padrão

Exemplos:
- `╔═● Channel 01`
- `╠═● Channel 02`
- ...
- `╚═● Channel 19`

Características:
- permanentes
- codec quality 6
- usados para voz
- subscribe/talk power mais restrito
- maxfamilyclients inherited

Permissões base observadas:
- `permid=86 permvalue=75`
- `permid=125 permvalue=75`
- `permid=133 permvalue=75`
- `permid=140 permvalue=10`
- `permid=142 permvalue=10`
- `permid=144 permvalue=10`

## Tipo 5 - Canais privados

Exemplos:
- `Private 2v2 01`
- `Private 2v2 02`
- `Private 4p 01`
- `Private 4p 02`
- `Private 5p 01`
- `Private 5p 02`

Características:
- mesma região lógica dos canais de voz
- provavelmente mesmo perfil base de permissões dos canais de voz
- confirmar depois se necessário

## Tipo 6 - AFK

Exemplo:
- `[cspacer] AFK`

Características:
- permanente
- codec quality 6
- `channel_needed_talk_power=99`

Permissões observadas:
- `permid=86 permvalue=75`
- `permid=125 permvalue=75`
- `permid=133 permvalue=75`
- `permid=140 permvalue=10`
- `permid=142 permvalue=10`
- `permid=144 permvalue=10`
- `permid=222 permvalue=99`

## Observação importante

Os nomes com contadores, por exemplo:
- `Enemys (0/0)`
- `Friends (1/85)`
- `Neutrals (160/160)`

e descrições com lista de players são dinâmicos.

No template, o ideal é recriar apenas a estrutura base do canal.
O conteúdo dinâmico será responsabilidade do bot.
