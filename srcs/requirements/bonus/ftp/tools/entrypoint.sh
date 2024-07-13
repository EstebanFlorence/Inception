#!/bin/sh

# if [ ! id "$FTP_USER" >/dev/null 2>&1 ]; then

    mv /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.default
    mv /vsftpd.conf /etc/vsftpd/vsftpd.conf

    # touch /var/log/vsftpd.log

    # addgroup wordpress
    # addgroup $FTP_USER wordpress
    # adduser -D $FTP_USER
    adduser -D $FTP_USER
    echo "$FTP_USER:$FTP_PASS" | chpasswd
    chown -R $FTP_USER:$FTP_USER /var/www/html

# fi

vsftpd /etc/vsftpd/vsftpd.conf