FROM alpine:latest

RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN apk update && apk add -u imagemagick

COPY main /usr/local/bin

WORKDIR /usr/src/app
VOLUME ["/usr/src/app"]

CMD [ "/bin/sh", "-c", "main"]