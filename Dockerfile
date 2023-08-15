# Use the official Airflow image as base
FROM apache/airflow:2.1.0

# Copy your DAG definition and test file into the container
COPY app/omd_dag.py /opt/airflow/dags/app/omd_dag.py
COPY tests/test_omd_dag.py /opt/airflow/dags/tests/test_omd_dag.py

# Set the required environment variable for SQLite metadata database
ENV AIRFLOW__CORE__SQL_ALCHEMY_CONN=sqlite:////Users/keerthanaakula/airflow/airflow.db

# Install any additional dependencies you need
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

# Define the entrypoint for the container
CMD ["webserver"]