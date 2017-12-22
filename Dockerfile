FROM arm32v6/node:alpine

WORKDIR /app

USER root
RUN mkdir -p /var/run/dbus

RUN apk --no-cache add dbus make avahi avahi-compat-libdns_sd avahi-dev g++ ffmpeg

COPY avahi-daemon.conf /etc/avahi/avahi-daemon.conf

RUN npm install -g --unsafe-perm homebridge
RUN npm install -g homebridge-camera-ffmpeg-omx

EXPOSE 5353 51827

CMD ["/app/run.sh"]

