FROM alpine

RUN set -xe \
    && apk add --no-cache ffmpeg \
                          openssl \
                          python3 \
                          aria2 \
    && pip3 install youtube-dl

RUN youtube-dl -o '%(playlist)s-%(playlist_index)s-%(title)s.%(ext)s' 'https://www.youtube.com/watch?v=s0dMTAQM4cw'

ENTRYPOINT [ "sh" ]

