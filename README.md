# ftp2http

Docker image combining vsftpd upload and apache httpd download.

## Getting Started

For an easy start, clone this repository and trigger a docker build

```
docker build .
```

This will generate a docker image that you can simply run with

```
run-docker.sh
```

## Overview

The image uses the Apache 2 httpd image (based on Alpine Linux) and adds the vsftpd FTP server. It maps the FTP upload directory to the HTTP download directory, the mapped directory is taken from the host `${PWD}/data`.

The server has users for the FTP part, that can use any FTP client and their credentials to upload to their own directory, that will be created automatically. The HTTP download is public (open).

## User Management

The user manegement is persisted, by mapping the local `${PWD}/etc` directory into the container, you can either modify the `etc/users.passwd` directly by running

```
htpasswd -bd etc/users.passwd 'user1' 'password1'
```

or by updating and executing the `init-users.sh` before or while running the container. The container watches the `etc/users.passwd` during runtime and creates a new FTP upload directory for each new user (please refer `include/watch-users.sh`).
