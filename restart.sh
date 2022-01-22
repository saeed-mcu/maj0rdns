docker stop $(docker ps -a | grep maj0rdnscontainer | cut -d " " -f 1)

docker rm $(docker ps -a | grep maj0rdnscontainer | cut -d " " -f 1)

docker build . -t maj0rdns:latest

docker run -d -it --cap-add=NET_ADMIN -p 53:53/udp -p 443:443 -p 80:80 -e IP=PublicIpOfContainer --name maj0rdnscontainer maj0rdns:latest 
