# Schmeckle 

$$$

## Setup

See below steps to get the IP Address of your container from Docker. 

### Docker

    docker-compose up
    docker ps -a  # to list docker container names, ids
    docker inspect <container_name>  # look for the 'IP Address' 

#### Get Container IP Address

To get a container's ip address (e.g. container_name is `schmeckle_db_1`, `schmeckle_airflow_1`):

    docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_name_or_id

#### Get Network Info

To list docker networks:

    docker network ls

To inspect a specific network (e.g `schmeckle_default`). By default, uses the default **bridge** network

    docker network inspect schmeckle_default

#### Attach to running container

To attach to a running container (so you can see what outputs on the log), specify the container name (e.g. `schmeckle_airflow_1`)

    docker attach schmeckle_airflow_1

### Airflow

Below steps assume Airflow is running on an IP Address of: `172.20.0.3`

Airflow runs a Flask server as a GUI: http://172.20.0.3:8080/admin/

#### Airflow Commands

    # print the list of active DAGs
    airflow list_dags

    # print the list of tasks for the 'tutorial' dag_id (e.g. dags/tutorial.py)
    airflow list_tasks tutorial
    
    # print the hierarchy of tasks in the 'tutorial' DAG
    airflow list_tasks tutorial --tree

    # testing tutorial's print_date task
    # follows format: command subcommand dag_id task_id date
    airflow test tutorial print_date 2017-08-19

### MySQL

Below steps assume MySQL is running on an IP Address of: `172.20.0.2`
