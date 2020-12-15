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

RUN youtube-dl -o '%(playlist)s-%(playlist_index)s-%(title)s.%(ext)s' --write-auto-sub  -i 'https://www.youtube.com/watch?v=CCnUS7jfRbA&feature=youtu.be&mc_cid=f1a3c3ae23&mc_eid=4af15ad57d'; exit 0

#https://www.youtube.com/watch?v=nysCzyoZtok&list=PLYPP1-8uH9c4qr1eKmnxMlaU8DSd88ciA 2020 fall meeting lightening talk
#https://www.youtube.com/watch?v=K8-lBJOLXq0 exhibit.so
#https://www.youtube.com/watch?v=tijCYc0lYIk&t=2392s iiif discovery