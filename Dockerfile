FROM python:3.6-alpine

ENV APP=/app
WORKDIR $APP
COPY . $APP

RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev build-base linux-headers pcre-dev

RUN pip install -r requirements.txt
RUN pip install alembic

