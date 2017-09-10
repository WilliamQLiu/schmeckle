FROM mysql:5.7.15
MAINTAINER Will Liu "william.q.liu@gmail.com"
RUN apt-get update && apt-get -y upgrade

ENV MYSQL_USER=root \
    MYSQL_ROOT_PASSWORD=schmeckle \
    MYSQL_DATABASE=airflow

# docker-entrypoint-initdb.d is where scripts automatically run on startup
# Schma created from: mysqldump -u root -p --no-data dbname > airflow_schema.sql
ADD airflow_schema.sql /docker-entrypoint-initdb.d

EXPOSE 3306