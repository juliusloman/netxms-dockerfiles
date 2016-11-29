# NetXMS WebUI docker image

Docker image of NetXMS WebUI Interface (www.netxms.org).


Run with:

	docker run -ti -e NETXMS_SERVER=<NETXMS_SERVER_HOSTNAME> --rm lomo/netxms-webui

where
* NETXMS\_SERVER\_HOSTNAME points to NetXMS server

After startup web ui is accessible at:

* http://\<container\_ip\>:8080/nxmc/nxmc

