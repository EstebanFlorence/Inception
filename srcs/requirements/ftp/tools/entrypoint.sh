#!/bin/sh

mv /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.default
mv /vsftpd.conf /etc/vsftpd/vsftpd.conf

# addgroup wordpress
# addgroup $FTP_USER wordpress
# adduser -D $FTP_USER
adduser -D $FTP_USER
echo "$FTP_USER:$FTP_PASS" | chpasswd
chown -R $FTP_USER:$FTP_USER /var/www/html

vsftpd /etc/vsftpd/vsftpd.conf