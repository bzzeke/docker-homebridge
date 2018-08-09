ARG arch=amd64
FROM ${arch}/node:alpine

WORKDIR /app
VOLUME /app

USER root
RUN mkdir -p /var/run/dbus

RUN apk --no-cache add dbus make avahi avahi-compat-libdns_sd avahi-dev g++ ffmpeg

COPY config/avahi-daemon.conf /etc/avahi/avahi-daemon.conf

RUN npm install -g --unsafe-perm homebridge@0.4.33
RUN npm install -g homebridge-camera-ffmpeg
RUN npm install -g homebridge-sesame

EXPOSE 5353 51827

CMD ["/app/run.sh"]

