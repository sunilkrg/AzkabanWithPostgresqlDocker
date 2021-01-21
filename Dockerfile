FROM <YOUR_REGISTRY_URL_ALPINE_JAVA_8>
#FROM java:8

RUN apk update \
 && apk add --no-cache openssh vim unzip wget curl \
 && apk add --upgrade bash

RUN mkdir -p /app

ADD azkaban_service /app/azkaban_service

COPY entrypoint.sh /app

EXPOSE 9091 12321

RUN addgroup -S jerry && adduser -S jerry -G jerry

RUN chown -R jerry:jerry /app
RUN chmod -R a+x /app
USER jerry

ENTRYPOINT /bin/bash /app/entrypoint.sh
