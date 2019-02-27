FROM httpd:2.4-alpine

# Install vsftpd and libpam (for virtual users)
RUN apk add --no-cache -U \
        bash \
        build-base \
        curl \
        inotify-tools \
        linux-pam-dev \
        tar \
        vsftpd \
    && mkdir pam_pwdfile \
        && cd pam_pwdfile \
        && curl -sSL https://github.com/tiwe-de/libpam-pwdfile/archive/v1.0.tar.gz | tar xz --strip 1 \
        && make install \
        && cd .. \
        && rm -rf pam_pwdfile \
    && apk del build-base \
        curl \
        linux-pam-dev \
        tar

RUN adduser -D ftp2http
RUN mkdir -p /var/run/vsftpd/empty && chmod ugo-wx /var/run/vsftpd/empty

COPY include/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY include/vsftpd.conf /etc/vsftpd.conf
COPY include/pam.d-vsftpd /etc/pam.d/vsftpd

COPY include/admin /etc/ftp-users/admin
COPY include/watch-users.sh /bin/watch-users.sh
COPY include/entrypoint.sh /bin/entrypoint.sh

RUN chmod +x /bin/watch-users.sh
RUN chmod +x /bin/entrypoint.sh

VOLUME ["/var/lib/ftp2http", "/etc/ftp2http"]

EXPOSE 20 21 80 20200-20210

CMD /bin/entrypoint.sh
