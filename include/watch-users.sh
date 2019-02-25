#!/bin/bash

function createUserDirs {
  USERS=$(cut -d: -f1 /etc/ftp2http/users.passwd)
  for USER in $USERS ; do
    if [ $USER != "admin" ]; then
      FILE=/etc/ftp-users/$USER
      mkdir -p "$(dirname "$FILE")"
      USER_DIR="/var/lib/ftp2http/${USER//.//}"
      echo "local_root=$USER_DIR" > $FILE
      mkdir -p $USER_DIR
      chown ftp2http:nogroup $USER_DIR
    fi
  done
}

createUserDirs
while inotifywait -e close_write /etc/ftp2http/users.passwd; do
  createUserDirs
done
