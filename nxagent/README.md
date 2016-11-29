# NetXMS Server agent image

Docker image of NetXMS agent.

Start with

	docker run lomo/netxms-nxagent

Environment variables

- **NXAGENT_CONFIG** - Config variable to set. Put your configuration options here, for example "EnableSNMPProxy=yes\nServers=server1\nMasterServers=server1". Content of this variable will will replace the agent config file.
- **NXAGENT_REGISTERSERVER** - Agent registration (put your NetXMS server hostname here)
- **NXAGENT_CONFIGSERVER** - Config server hostname
- **NXAGENT_LOGLEVEL** - log level
- **NXAGENT_PLATFORMSUFFIX** - platform suffix
