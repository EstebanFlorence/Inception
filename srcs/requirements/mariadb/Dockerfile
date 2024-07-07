FROM alpine:3.19

EXPOSE 3306

# USER mysql

RUN apk update && apk upgrade && \
    apk --no-cache add \
    gettext \
    mariadb \
    mariadb-client \
    && rm -rf /var/cache/apk/*

COPY ./conf/my.cnf /etc/my.cnf.d/inception.cnf

# COPY ./conf/init.sql /init.sql.template

COPY /tools/entrypoint.sh /entrypoint.sh

# RUN mariadb-install-db --defaults-file=/etc/my.cnf.d/inception.cnf

# RUN mkdir -p    /var/run/mysqld \
#                 /var/log/mysql

# RUN chown -R mysql:mysql    /var/run/mysqld \
#                             /var/log/mysql \
#                             /var/lib/mysql

RUN chmod +x /entrypoint.sh

# RUN sh /entrypoint.sh

# RUN rm /entrypoint.sh

# CMD [ "mariadbd-safe", "--defaults-file=/etc/my.cnf.d/inception.cnf" ]

CMD [ "/entrypoint.sh" ]
