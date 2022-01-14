FROM alpine:3.15

RUN apk add --update npm

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
