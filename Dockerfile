FROM alpine

MAINTAINER Jie Song 168

RUN set -xe \
    && apk update \
    && apk add --no-cache ffmpeg \
                          openssl \
                          python3 \
                          aria2 \
                          py-pip \
    && pip3 install youtube-dl

WORKDIR /data

RUN youtube-dl -o '%(playlist)s-%(playlist_index)s-%(title)s.%(ext)s' --write-auto-sub  -i 'https://www.youtube.com/watch?v=Yu-eCBqVu9Y'; exit 0


