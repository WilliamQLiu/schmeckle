#!/bin/sh

echo "Initializing Airflow"

# Kinda hacky way to check if mysql is ready
while ! mysql -e "select 1" -uroot -pschmeckle -h 172.20.0.2 -P 3306 --protocol=tcp >/dev/null 2>&1; do
sleep 1
echo "Waiting for mysql to start"
done

# Run Airflow Webserver
echo "Running Airflow Webserver"
airflow webserver -p 8080