FROM alpine:latest

RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN apk update && apk add -u \
    imagemagick \
    ffmpeg

COPY entrypoint.sh /usr/local/bin

WORKDIR /images
VOLUME ["/images"]


ENTRYPOINT [ "entrypoint.sh" ]