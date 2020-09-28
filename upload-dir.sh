#!/bin/bash

# Upload a directory $1 to the user $2's FTP directory into the container
find $1 -type f -exec curl -u admin:admin --ftp-create-dirs -T {} ftp://localhost/$2/{} \;
