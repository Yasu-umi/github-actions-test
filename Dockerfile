FROM python:3.10

ARG POETRY_VERSION=1.1.12
ARG PIP_VERSION=21.3.1

WORKDIR /usr/local/test

RUN pip install pip==${PIP_VERSION} --upgrade && \
    pip install --no-cache-dir poetry==${POETRY_VERSION} && \
    poetry config virtualenvs.in-project true

COPY poetry.lock pyproject.toml ./
RUN poetry install --no-dev
