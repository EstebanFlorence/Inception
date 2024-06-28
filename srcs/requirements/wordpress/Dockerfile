FROM alpine:3.19

RUN apk update && apk upgrade && \
    apk --no-cache add \
    wget \
    curl 

COPY /tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD [ "/entrypoint.sh" ]


