FROM python:3.10
WORKDIR /usr/src/northwind
RUN apt-get update && apt-get install -y python3-dev python3-pip
RUN pip3 install SQLAlchemy psycopg2-binary pandas
COPY . .
ENV PYTHONUNBUFFERED 1
CMD cron -f
