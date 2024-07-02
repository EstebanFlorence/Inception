#!/bin/sh

if [ ! -d /var/lib/mysql/wp ]; then
    mariadb-install-db --default-file=/my.cnf.d/inception.cnf
fi
