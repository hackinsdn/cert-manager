#!/bin/bash

/usr/sbin/cron

su nobody -s /bin/sh -c "cd /var/tmp && python3 -m http.server 8000"
