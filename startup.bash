#!/bin/bash
touch /var/log/openfire/all.log
chown openfire:openfire /var/log/openfire/all.log
service openfire start
tail -f /var/log/openfire/all.log

