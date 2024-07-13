FROM alpine:3.19

EXPOSE 21

RUN apk update && apk upgrade && \
    apk --no-cache add vsftpd \
    && rm -rf /var/cache/apk/*

COPY /conf/vsftpd.conf /vsftpd.conf

COPY /tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD [ "/entrypoint.sh" ]
