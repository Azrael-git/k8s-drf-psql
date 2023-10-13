FROM python:3.12-slim-bookworm

WORKDIR /app

RUN pip install poetry
ENV POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_VIRTUALENVS_CREATE=1 \
    POETRY_CACHE_DIR=/tmp/poetry_cache

COPY pyproject.toml poetry.lock ./
RUN poetry install --no-root && rm -rf $POETRY_CACHE_DIR
COPY . .
RUN poetry config virtualenvs.create false
RUN poetry install

ENTRYPOINT ["/app/docker-entrypoint.sh"]