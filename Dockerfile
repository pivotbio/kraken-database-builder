FROM ubuntu

RUN apt-get update && apt-get install -y \
  python

RUN pip install BioPython peewee
