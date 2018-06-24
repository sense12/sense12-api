FROM python:3.6.1-alpine3.6

ADD . /build

WORKDIR /build

RUN apk add --update make curl

ENV PATH="/usr/bin:/bin:$PATH"

ENTRYPOINT "make"
