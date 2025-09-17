FROM mysql:8.0.35

COPY ./initdb/dmg-test.sql /docker-entrypoint-initdb.d/
COPY ./dbconf/charset.cnf /etc/mysql/conf.d/charset.cnf

ENV MYSQL_DATABASE=dmg-test
ENV MYSQL_USER=mysqltest
