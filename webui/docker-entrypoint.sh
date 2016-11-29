#!/bin/sh

echo "server=$NETXMS_SERVER\nsessionTimeout=$NETXMS_SESSIONTIMEOUT\nenableAdvancedSettings=$NETXMS_ENABLEADVANCEDSETTINGS" >/usr/local/tomcat/lib/nxmc.properties

catalina.sh run
