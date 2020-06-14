# Projeto moodle em conteiner docker
Projeto: moodle-docker


Baixe o repositorio:


    git clone https://github.com/mlucasdasilva/moodle-docker.git moodle
    cd moodle


Para iniciar o banco de dados utilize um dos comandos:


    docker-compose up -d pgsql

ou

    docker-compose up -d mysql


Apos iniciar o banco de dados, incie o moodle:


    docker-compose up -d moodle


Na primeira vez que inicializar, ao ir para pagina web o moodle entrara no modo de instalacacao.
As informacoes solicitadas na instalação são as configurações utilizados no docker-compose.yml .

A instalação pode ser feita de forma automatica se alterar a seguinte configuração:

      - MOODLE_INSTALL_NON_INTERACTIVE=no
      #- MOODLE_INSTALL_NON_INTERACTIVE=yes

Para:

      #- MOODLE_INSTALL_NON_INTERACTIVE=no
      - MOODLE_INSTALL_NON_INTERACTIVE=yes

E alterar adequadamente a configuração da URL que será utilizada para acesso ao moodle:

      - MOODLE_INSTALL_WWWROOT_URL=http://192.168.56.56/moodle

As demais variaveis de configuração da instalação também podem ser revisada no momento da instalação (primeira execução).
Após instalaçõa estas variaveis MOODLE_INSTALL_* não possuem mais utilizadade e qualquer alteração deve ser feita no config.php.


