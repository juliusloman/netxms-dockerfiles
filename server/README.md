# NetXMS Server docker image

Docker image of NetXMS Server (www.netxms.org). Currently limited to SQLlite database. Database files and log files are located in docker volume /data.

Start with

	docker run lomo/netxms-server

Environment variables

NetXMS Server
- **NETXMS\_UNLOCKONSTARTUP** - set to 1 to unlock database on each container startup (default), set to 0 to skip database unlocking
- **NETXMS\_CONFIG** - Variable to set arbitrary config file entries to _/etc/netxmsd.conf_. Put your configuration options here.
- **NETXMS\_STARTAGENT** - Set to 1 to start the nxagent (default). Set to other value to disable agent startup.

NetXMS agent 
- **NXAGENT_CONFIG** - Config variable to set. Put your configuration options here, for example "EnableSNMPProxy=yes\nServers=server1\nMasterServers=server1". Content of this variable will will replace the agent config file.
- **NXAGENT_REGISTERSERVER** - Agent registration (put your NetXMS server hostname here)
- **NXAGENT_CONFIGSERVER** - Config server hostname
- **NXAGENT_LOGLEVEL** - log level
- **NXAGENT_PLATFORMSUFFIX** - platform suffix
