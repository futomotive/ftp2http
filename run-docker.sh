#!/bin/sh
docker run -it --rm \
    -p 80:80 \
    -p 20-21:20-21 \
    -p 20200-20210:20200-20210 \
    -v ${PWD}/etc:/etc/ftp2http:ro \
    -v ${PWD}/data:/var/lib \
    --name "p2-server" \
    futomotive/ftp2http:latest
