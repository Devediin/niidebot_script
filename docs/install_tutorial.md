# Tutorial de instalação

Este tutorial mostra como usar o repositório `niidebot_script` para provisionar uma nova VPS.

---

## 1. Clonar o repositório

Na VPS nova:

~~~bash
git clone https://github.com/Devediin/niidebot_script.git
cd niidebot_script
~~~

---

## 2. Criar o arquivo de configuração local

Copiar o arquivo de exemplo:

~~~bash
cp config/provision.conf.example config/provision.conf
~~~

Editar:

~~~bash
nano config/provision.conf
~~~

Ajustar principalmente:
- `APP_USER`
- `APP_HOME`
- `BOT_DIR`
- `TS3_BASE_DIR`
- `TS3_INSTALL_DIR`

Exemplo:

~~~bash
APP_USER=ubuntu
APP_HOME=/home/ubuntu
BOT_DIR=/home/ubuntu/tibia-ts3-teamspeakbot
TS3_BASE_DIR=/home/ubuntu/ts3
TS3_INSTALL_DIR=/home/ubuntu/ts3/teamspeak3-server_linux_amd64
~~~

---

## 3. Dar permissão de execução aos scripts

~~~bash
bash provision/00_prepare.sh
~~~

Ou:

~~~bash
chmod +x install.sh
find provision -type f -name "*.sh" -exec chmod +x {} \;
~~~

---

## 4. Rodar a instalação completa

~~~bash
bash install.sh
~~~

Ou:

~~~bash
bash provision/99_full_install.sh
~~~

---

## 5. Validar instalação

~~~bash
bash provision/07_validate_install.sh
~~~

---

## 6. Verificar serviços

~~~bash
sudo systemctl status mongod
sudo systemctl status ts3server.service
sudo systemctl status tibia-ts3-bot.service
~~~

---

## 7. Revisar o .env do bot

Se o script tiver criado o `.env` automaticamente, revisar:

~~~bash
nano /home/SEU_USUARIO/tibia-ts3-teamspeakbot/.env
~~~

Principal variável esperada:

~~~env
WORLD_NAME=SEU_MUNDO
~~~

Também revisar:
- conexão com Mongo
- credenciais do TS3
- nickname do bot
- demais variáveis exigidas pelo projeto

---

## 8. Portas importantes

Liberar no firewall/rede se necessário:

- `9987/udp` → TeamSpeak Voice
- `10011/tcp` → TeamSpeak ServerQuery
- `30033/tcp` → TeamSpeak FileTransfer

---

## 9. Observação importante

Neste momento, o provisionamento cobre principalmente:

- sistema base
- MongoDB
- Node.js / Yarn
- instalação do TeamSpeak 3
- instalação do bot
- criação dos serviços systemd

A parte de template completo do TS3 ainda será adicionada:
- grupos
- permissões
- canais
- ordem

---

## 10. Fluxo resumido

~~~bash
git clone https://github.com/Devediin/niidebot_script.git
cd niidebot_script
cp config/provision.conf.example config/provision.conf
nano config/provision.conf
bash install.sh
bash provision/07_validate_install.sh
~~~
