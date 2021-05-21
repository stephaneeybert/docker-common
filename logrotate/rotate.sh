#!/bin/bash

# Do a logrotate on startup and force the rotation of all logs
logrotate -f /etc/logrotate.conf

/usr/bin/tail -f /dev/null
