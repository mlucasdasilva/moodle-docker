#!/bin/bash

if [ ! -d "/var/www/html/moodle" ]; then
   echo "Deploy moodle"
   mv /moodle /var/www/html/moodle
else
   echo "Moodle already deployed. Preserved."
fi


if [ ! -f "/var/www/html/moodle/config.php" ]; then
  echo "config.php inexistente"
  if [ "$MOODLE_INSTALL_NON_INTERACTIVE" == "yes" ]; then
    echo "MOODLE_INSTALL_NON_INTERACTIVE=yes"
    echo "Install moodle"
    cd /var/www/html/moodle
    /usr/bin/php admin/cli/install.php                    \
        --non-interactive                                 \
        --agree-license                                   \
        --allow-unstable                                  \
        --chmod=$MOODLE_INSTALL_CHMOD_OCTAL_MODE          \
        --lang=$MOODLE_INSTALL_LANG_CODE                  \
        --wwwroot=$MOODLE_INSTALL_WWWROOT_URL             \
        --dataroot=$MOODLE_INSTALL_DATAROOT_DIR           \
        --dbtype=$MOODLE_INSTALL_DBTYPE_TYPE              \
        --dbhost=$MOODLE_INSTALL_DBHOST_HOST              \
        --dbname=$MOODLE_INSTALL_DBNAME_NAME              \
        --dbuser=$MOODLE_INSTALL_DBUSER_USERNAME          \
        --dbpass=$MOODLE_INSTALL_DBPASS_PASSWORD          \
        --dbport=$MOODLE_INSTALL_DBPORT_NUMBER            \
        --dbsocket=$MOODLE_INSTALL_DBSOCKET_PATH          \
        --prefix=$MOODLE_INSTALL_PREFIX_STRING            \
        --fullname=$MOODLE_INSTALL_FULLNAME_STRING        \
        --shortname=$MOODLE_INSTALL_SHORTNAME_STRING      \
        --summary=$MOODLE_INSTALL_SUMMARY_STRING          \
        --adminuser=$MOODLE_INSTALL_ADMINUSER_USERNAME    \
        --adminpass=$MOODLE_INSTALL_ADMINPASS_PASSWORD    \
        --adminemail=$MOODLE_INSTALL_ADMINEMAIL_STRING    \
        --upgradekey=$MOODLE_INSTALL_UPGRADEKEY_STRING    \
        $MOODLE_INSTALL_PARAMS
        chown apache:apache -R /var/www/html
  else
    echo "Moodle needs install actions via Web interface."
  fi
else
  echo "Moodle already installed. Preserved."
fi


#exec bash -c "/run-httpd.sh"

exec $@

