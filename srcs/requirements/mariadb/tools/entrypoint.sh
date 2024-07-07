#!/bin/sh

if [ ! -d /run/mysqld ]; then

    mkdir -p /run/mysqld
    chown -R mysql:mysql /run/mysqld
    # chmod

fi

if [ ! -d /var/lib/mysql/mysql ]; then

    chown -R mysql:mysql /var/lib/mysql
    mariadb-install-db --defaults-file=/etc/my.cnf.d/inception.cnf

    INNIT=/tmp/.innit

	echo "USE mysql;" > ${INNIT}
	echo "FLUSH PRIVILEGES;" >> ${INNIT}
	echo "DELETE FROM mysql.user WHERE User='';" >> ${INNIT}
	echo "DROP DATABASE IF EXISTS test;" >> ${INNIT}
	echo "DELETE FROM mysql.db WHERE Db='test';" >> ${INNIT}
	echo "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" >> ${INNIT}
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';" >> ${INNIT}
	echo "CREATE DATABASE ${WP_DB_NAME};" >> ${INNIT}
	echo "CREATE USER '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASSWORD}';" >> ${INNIT}
	echo "GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASSWORD}';" >> ${INNIT}
	echo "FLUSH PRIVILEGES;" >> ${INNIT}

    mariadbd --defaults-file=/etc/my.cnf.d/inception.cnf --bootstrap < ${INNIT}
    rm -f ${INNIT}

    # envsubst '$$DB_ROOT_PASSWORD $$DB_USER $$DB_PASSWORD $$DB_NAME' < /init.sql.template > /init.sql
    # mariadbd --defaults-file=/etc/my.cnf.d/inception.cnf --bootstrap < /init.sql
    # rm -f /init.sql.template

fi

exec mariadbd-safe --defaults-file=/etc/my.cnf.d/inception.cnf
