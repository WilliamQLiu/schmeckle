# Fluerbos 

$$$

## Setup

See below steps to get the IP Address of your container from Docker. 

### Docker

    docker-compose up
    docker ps -a  # to list docker container names
    docker inspect <container_name>  # look for the 'IP Address' 


### Airflow

Below steps assume Airflow is running on an IP Address of: `172.20.0.3`

Airflow runs a Flask server as a GUI: http://172.20.0.3:8080/admin/

### MySQL

Below steps assume MySQL is running on an IP Address of: `172.20.0.2`

