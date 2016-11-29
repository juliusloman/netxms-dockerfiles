#!/bin/bash

if [ ! -e "/data/.initialized" ];
then
	echo "Generating NetXMS server config file /etc/netxmsd.conf"
	echo -e "Logfile=/data/netxms.log\nDBDriver=sqlite.ddr\nDBName=/data/netxms.db\n" >/etc/netxmsd.conf
	echo "$NETXMS_CONFIG" >> /etc/netxmsd.conf

	echo "Initializing NetXMS SQLLite database"
	nxdbmgr init /usr/share/netxms/sql/dbinit_sqlite.sql

	echo -e "[supervisord]\nnodaemon=true\n[program:netxms-server]\ncommand=/usr/bin/netxmsd -q\n" >/etc/supervisor/conf.d/supervisord.conf

	[ "$NETXMS_STARTAGENT" -gt 0 ] && echo -e "[program:netxms-nxagent]\ncommand=/nxagent.sh\n" >>/etc/supervisor/conf.d/supervisord.conf

	touch /data/.initialized
fi

# Fix SMS kannel Drv
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libcurl.so.4
if [ "$NETXMS_UNLOCKONSTARTUP" -gt 0 ];
then
	echo "Unlocking database"
	echo "Y"|nxdbmgr unlock
fi

exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

