#!/bin/bash

#define color for print or echo
GREEN='\033[0;32m';
RED='\033[0;31m';
NC='\033[0m';

# build the container
PUBLIC_IP_SERVER=192.168.1.10
CONTAINER_NAME=maj0rdnscontainer
IMAGE_NAME=maj0rdns:latest

echo -e "${GREEN}Building SNI-Proxy Image${NC}"
docker build . -t $IMAGE_NAME

echo -e "${GREEN}Removing old Container(s)${NC}"
RUNNING_CONTAINER_COUNT=`docker ps -a | grep $CONTAINER_NAME | wc -l`
if (( $RUNNING_CONTAINER_COUNT == 0 )); then
	echo -e " * No container is found"
else
	echo -e " * Removing $RUNNING_CONTAINER_COUNT container"
    docker container rm $(docker ps -a | grep $CONTAINER_NAME | cut -d " " -f 1) --force
fi

echo -e "${GREEN}Running SNI-Proxy${NC}"
docker run -d -it --cap-add=NET_ADMIN -p 53:53/udp -p 443:443 -p 80:80 -e IP=$PUBLIC_IP_SERVER --restart unless-stopped --name $CONTAINER_NAME $IMAGE_NAME


# build the cluster
# docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME
# docker service create --cap-add=NET_ADMIN -p 53:53/udp -p 443:443 -p 80:80 -e IP=$PUBLIC_IP_SERVER --name $CONTAINER_NAME $IMAGE_NAME
# docker service scale $CONTAINER_NAME=5
# docker service ls
# docker service ps $CONTAINER_NAME