#!/bin/sh

if [ -d /var/lib/mysql/mysql ]; then

    # mariadb-install-db --defaults-file=/etc/my.cnf.d/inception.cnf

    # WordPress
    envsubst '$$DB_ROOT_PASSWORD $$DB_USER $$DB_PASSWORD $$DB_NAME' < /init.sql.template > /init.sql
    mariadbd --defaults-file=/etc/my.cnf.d/inception.cnf --bootstrap < /init.sql
    # rm -f /init.sql.template

fi
