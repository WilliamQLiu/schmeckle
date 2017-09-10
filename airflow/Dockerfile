FROM ubuntu:16.04
MAINTAINER Will Liu "william.q.liu@gmail.com"
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install python-pip python-dev build-essential libmysqlclient-dev
#COPY ./requirements.txt /airflow/requirements.txt
# Copy all configs over
COPY . /root/airflow/
WORKDIR /root/airflow
RUN export AIRFLOW_HOME=/root/airflow
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# initialize the database
#RUN airflow initdb  # Inits to /root/airflow/ with default configs (e.g. sqlite)
# We will skip init the db because it'll need to wait for mysql so instead 
# just having mysql load the airflow schema during creation

# start the web server, default port is 8080
RUN airflow webserver -p 8080
EXPOSE 8080