FROM alpine:3.19

ARG USER

ENV USER=${USER}

RUN apk update && apk upgrade && \
    apk --no-cache add nginx openssl gettext

COPY /conf/nginx.conf /etc/nginx/nginx.conf.template

COPY /tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD [ "/entrypoint.sh" ]

EXPOSE 443 8080
