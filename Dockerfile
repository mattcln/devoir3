FROM python:latest

RUN pip install psycopg2

COPY manager /manager/

RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -P /
RUN chmod +x /wait-for-it.sh
ENTRYPOINT ["/wait-for-it.sh", "db:5432", "--"]

CMD ["python3", "-m",  "manager"]
