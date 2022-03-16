#!/bin/sh
service dbus start
service xrdp start
exec "$@"