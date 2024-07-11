FROM alpine:3.19

EXPOSE 8080

RUN apk update && apk upgrade && \
    apk --no-cache add \
    wget \
	curl \
	less \
	mariadb-client \
	php83 \
	php83-fpm \
	php83-common \
	php83-session \
	php83-iconv \
	php83-json \
	php83-gd \
	php83-curl \
	php83-xml \
	php83-mysqli \
	php83-imap \
	php83-pdo \
	php83-pdo_mysql \
	php83-soap \
	php83-posix \
	php83-gettext \
	php83-ldap \
	php83-ctype \
	php83-dom \
	php83-simplexml \
    && rm -rf /var/cache/apk/*

WORKDIR /var/www/html

RUN wget https://www.adminer.org/latest.php -O adminer.php

CMD [ "php83", "-S", "10.0.0.6:8080", "adminer.php" ]
