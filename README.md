# Projeto moodle em conteiner docker
Projeto: moodle-docker


Baixe o repositorio:


    git clone https://github.com/mlucasdasilva/moodle-docker.git moodle
    cd moodle


Para iniciar o banco de dados utilize um dos comandos:


    docker-compose up -d pgsql

ou

    docker-compose up -d mysql


Apos iniciar o banco de dados, inicie o moodle:


    docker-compose up -d moodle


Na primeira vez que inicializar, ao ir para pagina webi, o moodle entrara no modo de instalacao.
As informacoes solicitadas na instalação são as mesmas configurações utilizados no docker-compose.yml .


A instalação sera de forma automatica se alterar a seguinte configuração:


      - MOODLE_INSTALL_NON_INTERACTIVE=no
      #- MOODLE_INSTALL_NON_INTERACTIVE=yes

Para:

      #- MOODLE_INSTALL_NON_INTERACTIVE=no
      - MOODLE_INSTALL_NON_INTERACTIVE=yes


Tambem deve alterar adequadamente a configuração da URL que será utilizada para acesso ao moodle:


      - MOODLE_INSTALL_WWWROOT_URL=http://192.168.56.56/moodle


As demais variaveis de configuração da instalação também podem ser revisadas no momento da instalação (primeira execução).
Após instalacao estas variaveis MOODLE_INSTALL_* não possuem mais utilidade e podem ser removidads do docker-compose.yml .
Qualquer alteração após instalção incial deve ser feita diretamente no config.php.


O docker-composer.yml pode ser alterado de forma a conter apenas o que for necessario.

