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

RUN youtube-dl -o '%(playlist)s-%(playlist_index)s-%(title)s.%(ext)s' --write-auto-sub  -i 'https://www.youtube.com/playlist?list=PLYPP1-8uH9c4QFWKf-dbv3Il4ukkuFAje'; exit 0


