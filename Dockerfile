ARG PYTHON_VERSION=3.9-slim-bullseye

FROM python:${PYTHON_VERSION}

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir -p /code

WORKDIR /code

COPY requirements.txt /tmp/requirements.txt
RUN set -ex && \
    pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt && \
    rm -rf /root/.cache/
COPY crowdfunding/ /code/

ENV SECRET_KEY "NKvYAtJi1k6RYrLWB4SEWBoUc4oeZt6GwnaOuP5SQPoys0RWxl"
RUN python manage.py collectstatic --noinput

RUN chmod +x /code/run.sh

EXPOSE 8000

CMD ["/code/run.sh"]
