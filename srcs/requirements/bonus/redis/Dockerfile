FROM alpine:3.19

EXPOSE 6379

RUN apk update && apk upgrade && \
    apk --no-cache add redis \
    && rm -rf /var/cache/apk/*

COPY /tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD [ "/entrypoint.sh" ]
