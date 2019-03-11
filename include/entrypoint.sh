#!/bin/sh

echo "Creating data directory..."
DATA_DIR=/var/lib/ftp2http
if [[ ! -e $DATA_DIR ]]; then
    mkdir -p $DATA_DIR
    chown ftp2http:nogroup $DATA_DIR
fi

echo "Starting httpd..."
/usr/local/apache2/bin/apachectl

echo "Starting vsftpd..."
/usr/sbin/vsftpd /etc/vsftpd.conf

echo "Watching /etc/ftp2http/users.passwd..."
/bin/watch-users.sh
