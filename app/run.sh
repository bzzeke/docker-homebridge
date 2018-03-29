#!/bin/sh

rm -f /var/run/dbus/pid /var/run/avahi-daemon/pid

dbus-daemon --system
avahi-daemon -D


/usr/local/bin/homebridge -U /app
