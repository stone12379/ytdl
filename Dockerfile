FROM alpine

MAINTAINER Jie Song 168

RUN set -xe \
    && apk add --no-cache ffmpeg \
                          openssl \
                          python3 \
                          aria2 \
    && pip3 install youtube-dl

WORKDIR /data

RUN youtube-dl -o '%(playlist)s-%(playlist_index)s-%(title)s.%(ext)s' --write-auto-sub  -i 'https://www.youtube.com/watch?v=zvDgi7tSPPM'; exit 0


