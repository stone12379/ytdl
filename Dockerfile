FROM alpine

RUN set -xe \
    && apk update \
    && apk add --no-cache ffmpeg \
                          openssl \
                          python3 \
                          aria2 \
                          py-pip \
    && pip3 install youtube-dl

WORKDIR /data

RUN youtube-dl -o '%(playlist)s-%(playlist_index)s-%(title)s.%(ext)s' --write-auto-sub  -i 'https://www.youtube.com/watch?v=2n7bm0mteG0'; exit 0
RUN youtube-dl -o '%(playlist)s-%(playlist_index)s-%(title)s.%(ext)s' --write-auto-sub  -i 'https://www.youtube.com/watch?v=gXNbOtH97zc'; exit 0
RUN youtube-dl -o '%(playlist)s-%(playlist_index)s-%(title)s.%(ext)s' --write-auto-sub  -i 'https://www.youtube.com/watch?v=DR956EG56Qg'; exit 0

