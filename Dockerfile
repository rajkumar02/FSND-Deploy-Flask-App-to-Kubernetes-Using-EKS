FROM python:stretch

RUN mkdir /app

COPY main.py /app
COPY requirements.txt /app

WORKDIR /app

RUN apt update -y
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 8080/tcp

ENTRYPOINT [ "gunicorn", "-b", ":8080", "main:APP" ]