FROM alpine:3.19

RUN apk update && apk upgrade && \
    apk --no-cache add nginx openssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD [ "nginx", "-g", "daemon off;" ]

EXPOSE 443 8080
