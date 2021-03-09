FROM python:3.8.3-alpine

EXPOSE  8000

ENV APP_DIR /home/app
ENV APP_USER django
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN addgroup -S $APP_USER && adduser -S $APP_USER -G $APP_USER
RUN mkdir -p $APP_DIR
RUN mkdir -p $APP_DIR/static


WORKDIR $APP_DIR
COPY . $APP_DIR

RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add postgresql-dev gcc python3-dev musl-dev \
    && apk del build-deps \
    && apk --no-cache add musl-dev linux-headers g++

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

COPY ./entrypoint.sh $APP_DIR

CMD ["/bin/bash", "/home/app/entrypoint.sh"]
