FROM ubuntu:16.04
MAINTAINER Will Liu "william.q.liu@gmail.com"
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install python-pip python-dev build-essential libmysqlclient-dev

# mysql-client needed for mysql connection, libffi-dev for crypto
RUN apt-get -y install mysql-client libffi-dev

# Copy all configs over
COPY . /root/airflow/
WORKDIR /root/airflow
RUN export AIRFLOW_HOME=/root/airflow
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# run airflow worker by root, don't do on production
ENV C_FORCE_ROOT true  

# Do not load DAGs examples
ENV LOAD_EX=n

# initialize the database
#RUN airflow initdb  # Inits to /root/airflow/ with default configs (e.g. sqlite)
# We will skip init the db because it'll need to wait for mysql so instead 
# just having mysql load the airflow schema during creation

# start the web server, default port is 8080
#RUN airflow webserver -p 8080
EXPOSE 8080

# Celery Flower
EXPOSE 5555

EXPOSE 8793