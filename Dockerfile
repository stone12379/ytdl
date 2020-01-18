FROM alpine

RUN set -xe \
    && apk add --no-cache ffmpeg \
                          openssl \
                          python3 \
                          aria2 \
    && pip3 install youtube-dl

RUN sudo -H pip install --upgrade youtube-dl

RUN youtube-dl -o '%(playlist)s-%(playlist_index)s-%(title)s.%(ext)s' --write-auto-sub 'https://www.youtube.com/playlist?list=PL8HAkqKX065DygZJKmkmAly8t2ymxjFyO'


