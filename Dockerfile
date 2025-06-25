FROM python:3.10-slim

ENV POETRY_VERSION=1.8.5
RUN pip install "poetry==$POETRY_VERSION"

COPY pyproject.toml poetry.lock ./

RUN poetry config virtualenvs.create false && poetry install --no-interaction --no-ansi

COPY . .

CMD ["poetry", "run", "mypy", "."]