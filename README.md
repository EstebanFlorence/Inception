![Inception-wordmark](https://github.com/user-attachments/assets/b10461e2-90a5-4384-a5ae-caf9c5eb6d91)


#
<p align="center">
Docker Compose for a simple LAMP stack
</p>

This is a Docker based system administration project, consisting of a small infrastructure composed of several services, each of which runs in a dedicated container

## Technologies
All the images are based on Alpine, the Docker images are built with Dockerfile

- NGINX: Web Server
- MariaDB: Database
- WordPress + phpfpm: PHP processor
- Adminer: Databse Manager
- redis: cache server
- ftp: vsftp server

## Documentation

- https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard
- https://www.youtube.com/watch?v=eyNBf1sqdBQ
- https://alpinelinux.org/releases/
https://wiki.alpinelinux.org/wiki/Setting_up_a_new_user

## Docker
- https://docs.docker.com/build/building/best-practices/
- https://www.padok.fr/en/blog/docker-processes-container
- https://docs.docker.com/engine/security/certificates/

### Dockerfile
- https://docs.docker.com/reference/dockerfile/
- https://docs.docker.com/guides/docker-concepts/building-images/writing-a-dockerfile/

### Docker-compose
- https://docs.docker.com/compose/reference/
- https://docs.docker.com/compose/compose-file/05-services/

## NGINX
- http://nginx.org/en/docs/http/configuring_https_servers.html
- https://www.youtube.com/watch?v=X3Pr5VATOyA
- https://www.quora.com/Why-do-almost-all-Nginx-users-change-the-root-to-var-www-HTML-from-the-default-usr-share-nginx-HTML-Any-performance-or-security-reasons
- https://www.digitalocean.com/community/tutorials/understanding-and-implementing-fastcgi-proxying-in-nginx

## MariaDB
- https://wiki.alpinelinux.org/wiki/MariaDB
- https://mariadb.com/get-started-with-mariadb/
- https://mariadb.com/kb/en/mariadb-install-db/
- https://mariadb.com/kb/en/configuring-mariadb-with-option-files/
- https://mariadb.com/kb/en/server-system-variables/
- https://mariadb.com/kb/en/mariadbd-options/

## WordPress
- https://developer.wordpress.org/apis/wp-config-php/
- https://make.wordpress.org/cli/handbook/guides/installing/
- https://developer.wordpress.org/cli/commands/

## Redis Cache
- https://github.com/rhubarbgroup/redis-cache/blob/develop/INSTALL.md

## FTP Server
- https://wiki.alpinelinux.org/wiki/FTP
- http://vsftpd.beasts.org/vsftpd_conf.html

