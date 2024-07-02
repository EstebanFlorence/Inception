FROM alpine:3.19

ARG USER

ENV USER=${USER}

# rm -f /var/cache/apk/*
RUN apk update && apk upgrade && \ 
    apk --no-cache add \
    # openrc \
    mariadb \
    mariadb-client

RUN mkdir -p    /var/run/mysqld \
                /var/log/mysql

RUN chown -R mysql:mysql    /var/run/mysqld \
                            /var/log/mysql
                            # /var/lib/mysql

COPY ./conf/my.cnf /etc/my.cnf.d/inception.cnf

COPY /tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

# RUN sh /entrypoint.sh

# CMD [ "mariadbd-safe", "--defaults-file=/etc/my.cnf.d/inception.cnf" ]

CMD [ "/bin/sh" ]
