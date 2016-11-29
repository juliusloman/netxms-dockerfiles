# NetXMS Console docker image (www.netxms.org)

This is a packaged native NetXMS console (GUI). 

Run with:

	docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix lomo/netxms-nxmc

If running this image fails with "No protocol" message, verify if X11 connections are allowed to your X11 server or allow connection from any host before running this image using:

	xhost +
