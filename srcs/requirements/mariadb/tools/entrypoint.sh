#!/bin/sh

if [ ! -d /var/log/mysql ]; then

    mkdir -p /var/log/mysql
    # chown -R mysql:mysql /var/log/mysql

fi

if [ ! -d /run/mysqld ]; then

    mkdir -p /run/mysqld
    # chown -R mysql:mysql /run/mysqld

fi


chown -R mysql:mysql /var/log/mysql
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql

if [ ! -d /var/lib/mysql/mysql ]; then

    # chown -R mysql:mysql /var/lib/mysql
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
    # rm -f ${INNIT}
    touch done.txt

fi

exec mariadbd-safe --defaults-file=/etc/my.cnf.d/inception.cnf
