#!/bin/sh
docker run -dit --rm \
    -p 80:80 \
    -p 20-21:20-21 \
    -p 20200-20210:20200-20210 \
    -v ${PWD}/etc:/etc/ftp2http:ro \
    -v ${PWD}/my-data:/var/lib/ftp2http \
    --name "my-server" \
    ftp2http
