FROM python:3.10-slim

RUN pip install "poetry==1.8.5"

COPY pyproject.toml poetry.lock ./

RUN poetry config virtualenvs.create false && poetry install --no-interaction --no-ansi

COPY . .