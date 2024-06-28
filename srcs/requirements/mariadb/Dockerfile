FROM alpine:3.19

RUN apk update && apk upgrade && \
    apk --no-cache add \
    mariadb

CMD [ "tail", "-f" ]
