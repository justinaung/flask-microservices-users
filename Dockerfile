FROM python:3.6.1

RUN apt-get update \
    && apt-get install -y \
    && pip3 install pipenv

WORKDIR /usr/src/app

COPY Pipfile Pipfile.lock ./

RUN pipenv install --system

COPY . /usr/src/app

CMD python manage.py runserver -h 0.0.0.0
