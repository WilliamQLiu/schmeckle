"""
Tutorial on how to create Airflow Dags
Usage:
    python tutorial.py
"""


from airflow import DAG
from airflow.operators.bash_operator import BashOperator 
from datetime import datetime, timedelta


default_args = {
    'owner': 'will',
    'depends_on_past': False,
    'start_date': datetime(2017, 8, 17),
    'email': ['william.q.liu@gmail.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
    # 'queue': 'bash_queue',
    # 'pool': 'backfill',
    # 'priority_weight': 10,
    # 'end_date': datetime(2016, 1, 1),
}

# Just defines a DAG object
dag = DAG('tutorial', default_args=default_args)

# t1, t2 and t3 are examples of tasks created by instantiating operators
t1 = BashOperator(
    task_id='print_date',
    bash_command='date',
    dag=dag)

t2 = BashOperator(
    task_id='sleep',
    bash_command='sleep 5',
    retries=3,
    dag=dag)

# Airflow uses Jinga Templating, with 'ds' as the most common template variable
templated_command = """
    {% for i in range(5) %}
        echo "{{ ds }}"
        echo "{{ macros.ds_add(ds, 7)}}"
        echo "{{ params.my_param }}"
    {% endfor %}
"""

t3 = BashOperator(
    task_id='templated',
    bash_command=templated_command,
    params={'my_param': 'Parameter I passed in'},
    dag=dag)


# Can set dependencies
t2.set_upstream(t1)  # t2 will depend on t1, same as `t1.set_downstream(t2)`
t3.set_upstream(t1)  # t3 will depend on t1, same as `t1.set_downstream(t3)`

# The above is equivalent to:
#dag.set_dependency('print_date', 'sleep')
#dag.set_dependency('print_date', 'templated')

