#!/bin/bash
export JAVA_HOME=/opt/java
export PATH=$JAVA_HOME/bin:$PATH

touch /opt/openfire/logs/all.log
/opt/openfire/bin/openfire start
tail -f /opt/openfire/logs/all.log

