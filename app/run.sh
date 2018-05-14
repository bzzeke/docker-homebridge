#!/bin/sh

rm -fr /var/run/dbus.pid /var/run/avahi-daemon/pid

dbus-daemon --system
avahi-daemon -D


/usr/local/bin/homebridge -U /app
