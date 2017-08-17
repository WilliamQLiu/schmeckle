FROM ubuntu:16.04
MAINTAINER Will Liu "william.q.liu@gmail.com"
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install python-pip python-dev build-essential libmysqlclient-dev
COPY ./requirements.txt /airflow/requirements.txt
WORKDIR /airflow
RUN export AIRFLOW_HOME=/airflow
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
# initialize the database
RUN airflow initdb
# start the web server, default port is 8080
#RUN airflow webserver -p 8080
EXPOSE 8080