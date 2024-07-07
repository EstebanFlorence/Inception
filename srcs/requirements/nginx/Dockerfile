FROM alpine:3.19

EXPOSE 443 8080

COPY /conf/nginx.conf /etc/nginx/nginx.conf.template

COPY /tools/entrypoint.sh /entrypoint.sh

RUN apk update && apk upgrade && \
    apk --no-cache add \
    nginx \
    openssl \
    gettext \
    && rm -rf /var/cache/apk/*

RUN chmod +x /entrypoint.sh

# RUN sh /entrypoint.sh

# RUN rm /entrypoint.sh

# CMD [ "nginx", "-g", "daemon off;" ]

CMD [ "/entrypoint.sh" ]
