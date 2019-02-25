#!/bin/bash
find $1 -type f -exec curl -u admin:admin --ftp-create-dirs -T {} ftp://localhost/$2/{} \;
