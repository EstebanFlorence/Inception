#!/bin/sh

if [ ! -d /var/lib/mysql/mysql ]; then
    mariadb-install-db --defaults-file=/etc/my.cnf.d/inception.cnf
fi
