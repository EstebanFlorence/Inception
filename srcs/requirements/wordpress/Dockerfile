FROM alpine:3.19

EXPOSE 9000

RUN apk update && apk upgrade && \
    apk --no-cache add \
    gettext \
    curl \
    php83 \
    php83-fpm \
    php83-mysqli \
    php83-phar \
    php83-mbstring \
    php83-redis \
    php83-ctype \
    && rm -rf /var/cache/apk/*

RUN ln -s /usr/bin/php83 /usr/bin/php

RUN mkdir -p /var/www/html

COPY /conf/wp-config.php /wp-config-tmp.php

COPY /tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

# WORKDIR /var/www/html

CMD [ "/entrypoint.sh" ]
