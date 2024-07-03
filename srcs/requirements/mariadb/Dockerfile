FROM alpine:3.19

ARG USER

ENV USER=${USER}

EXPOSE 3306

RUN apk update && apk upgrade && \
    apk --no-cache add \
    mariadb \
    mariadb-client \
    && rm -rf /var/cache/apk/*

COPY ./conf/my.cnf /etc/my.cnf.d/inception.cnf

COPY /tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN sh /entrypoint.sh

RUN rm /entrypoint.sh

RUN mkdir -p    /var/run/mysqld \
                /var/log/mysql

RUN chown -R mysql:mysql    /var/run/mysqld \
                            /var/log/mysql \
                            /var/lib/mysql

CMD [ "mariadbd-safe", "--defaults-file=/etc/my.cnf.d/inception.cnf" ]
