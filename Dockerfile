FROM busybox AS build

ARG OS=linux
ARG ARCH=x64
ARG VERSION=v2.4.0
ARG EXT

ENV FILENAME qshell-${OS}-${ARCH}-${VERSION}${EXT}

RUN set -x \
    && wget -O /qshell.zip http://devtools.qiniu.com/${FILENAME}.zip \
    && mkdir /dist \
    && unzip /qshell.zip -d /dist \
    && mv /dist/${FILENAME} /qshell

FROM alpine

RUN apk add --no-cache ca-certificates
COPY --from=build /qshell /usr/bin/qshell
RUN chmod +x /usr/bin/qshell

RUN set -xe \
    && apk add --no-cache ffmpeg \
                          openssl \
                          python3 \
                          aria2 \
    && pip3 install youtube-dl

COPY . /home

WORKDIR /data

RUN chmod +x /home/single-dl.sh

EXPOSE 5000

ENTRYPOINT [ "sh", "/home/single-dl.sh" ]

