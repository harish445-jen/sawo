# TODO: If docker used in production environment adjust for mongoDB
FROM python:3.7
LABEL maintainer Prasanta Kakati <prasantakakati@sawolabs.com>
RUN apt-get update && \
    apt-get install --yes build-essential curl
RUN mkdir /sawo-api
WORKDIR /sawo-api
RUN curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
COPY pyproject.toml poetry.lock /sawo-api/
RUN . $HOME/.poetry/env && \
    poetry config virtualenvs.create false && \
    poetry install --no-dev
COPY . /sawo-api
CMD [ "sh", "start.sh" ]
