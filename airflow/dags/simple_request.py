from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.python_operator import PythonOperator 
import requests
import json


default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2017, 9, 24),
    'email': ['airflow@airflow.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5)
}

dag = DAG(
    'simple_request', default_args=default_args,
    schedule_interval=timedelta(minutes=10)
)


def request_github_events(user=None):
    """ Make a request to GitHub API for recent events"""
    print "Getting Recent GitHub Events"
    if user:
        response = requests.get('https://api.github.com/users/' + str(user) + '/events')
    else:
        response = requests.get('https://api.github.com/events')
    response_json = response.json()
    print response_json


task1 = PythonOperator(task_id='get_github_events', provide_context=True, python_callable=request_github_events, dag=dag)
