FROM alpine:3.19

EXPOSE 443

RUN apk update && apk upgrade && \
    apk --no-cache add \
    nginx \
    openssl \
    gettext \
    && rm -rf /var/cache/apk/*

COPY /conf/nginx.conf /etc/nginx/nginx.conf.template

COPY /tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD [ "/entrypoint.sh" ]
