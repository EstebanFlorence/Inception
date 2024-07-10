FROM alpine:3.19

EXPOSE 6379

RUN apk update && apk upgrade && \
    apk --no-cache add redis \
    && rm -rf /var/cache/apk/*

COPY /tools/entrypoint.sh /tmp/entrypoint.sh

RUN chmod +x /tmp/entrypoint.sh

# ENTRYPOINT [ "/tmp/entrypoint.sh" ]

CMD [ "redis-server", "/etc/redis.conf" ]

# CMD [ "redis-server" ]
