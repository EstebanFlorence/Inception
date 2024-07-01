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
#                             /var/lib/mysql # ???

COPY ./conf/my.cnf etc/my.cnf.d/

CMD [ "/bin/sh" ]

# CMD [ "mysqld_safe" ]
