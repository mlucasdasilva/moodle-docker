#!/bin/bash

if [ ! -d "/var/www/html/moodle" ]; then
   echo "Deploy moodle"
   mv /moodle /var/www/html/moodle
else
   echo "Moodle ja instalado. Preservado."
fi

#exec bash -c "/run-httpd.sh"

exec $@

