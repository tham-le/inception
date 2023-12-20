FROM alpine:3.18

RUN apk update

RUN apk add mariadb mariadb-client

RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db

RUN mkdir -p /run/mysqld
RUN chown -R mysql /run/mysqld
COPY tool/mariadb-init.sql /etc/
COPY tool/entrypoint.sh /etc/

ENTRYPOINT [ "sh", "/etc/entrypoint.sh"]

