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

COPY /tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD [ "/entrypoint.sh" ]
