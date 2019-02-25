#!/bin/sh

echo "Starting httpd..."
/usr/local/apache2/bin/apachectl

echo "Starting vsftpd..."
/usr/sbin/vsftpd /etc/vsftpd.conf

echo "Watching /etc/ftp2http/users.passwd..."
/bin/watch-users.sh
