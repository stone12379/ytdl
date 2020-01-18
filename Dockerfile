FROM alpine

MAINTAINER Joe Song

RUN set -xe \
    && apk add --no-cache ffmpeg \
                          openssl \
                          python3 \
                          aria2 \
    && pip3 install youtube-dl

RUN youtube-dl -o '%(playlist)s-%(playlist_index)s-%(title)s.%(ext)s' --write-auto-sub  -i 'https://www.youtube.com/playlist?list=PL8HAkqKX065DygZJKmkmAly8t2ymxjFyO'; exit 0


