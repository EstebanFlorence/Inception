FROM baseImage

RUN ex: apt update && apt upgrade && apt install -y nginx

COPY source dest

CMD [ "nginx", "-g", "daemon off;" ]
