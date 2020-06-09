FROM mlucasdasilva/centos7-php74

RUN ln -snf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

RUN yum -y update && yum clean all
RUN yum -y install unzip

RUN yum -y install wget git

ARG APP_VERSION
ENV APP_VERSION=${APP_VERSION:-3.8.3}

ARG MOODLE_V=38

# RUN git clone -b MOODLE_${MOODLE_V}_STABLE git://git.moodle.org/moodle.git moodle-git
RUN wget https://download.moodle.org/download.php/direct/stable${MOODLE_V}/moodle-latest-${MOODLE_V}.tgz
#ADD moodle-latest-${MOODLE_V}.tgz /.
RUN tar -xvzf /moodle-latest-${MOODLE_V}.tgz \
    && rm -f moodle-latest-${MOODLE_V}.tgz

#chown -R root /path/to/moodle
#chmod -R 0755 /path/to/moodle
RUN chown apache:apache -R /moodle 

# Simple install and startup script
COPY entrypoint.sh /entrypoint.sh
RUN chmod -v +x /entrypoint.sh

# Php.ini ajustado
#COPY php.ini /etc/php.ini

# Pacotes extenção php
ARG PHP_V=74
RUN yum --enablerepo=remi-php${PHP_V} -y install \
                   php-opcache php-cli php-common php-intl \
                   php-mbstring php-mcrypt php-soap php-xml php-xmlrpc php-gd php-json \
                   php-imap php-snmp php-ldap \
                   php-pear php-mysql php-mssql php-pgsql php7-pdo \
                   php-zip

RUN mkdir /var/www/moodledata && chown apache:apache /var/www/moodledata

VOLUME [ "/var/www/moodledata" ; "/var/www/html" ]

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]

CMD [ "bash -c" , "/run-httpd.sh" ]

