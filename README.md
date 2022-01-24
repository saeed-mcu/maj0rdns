# maj0rdns
An smart DNS for bypassing geo restorations of specific various web services 


#Build

docker build . -t maj0rdns:latest


#Run

docker run -d -it --cap-add=NET_ADMIN -p 53:53/udp -p 443:443 -p 80:80 -e IP=PublicIpOfContainer maj0rdns:latest


#Usage

echo "" > /etc/resolv.conf && echo "nameserver Public_IP_Of_Container" >> /etc/resolv.conf


#Verify 

run curl api.myip.com on your local system

it should return your public ip of container 


#Restart

to restart the container after changing the config files

./restart.sh


#Cluster Mode ( docker swarm ) 

after builing the container to run a cluster do the following 

#1- swarm init

docker swarm init

#2- create docker swarm service 

docker service create --cap-add=NET_ADMIN -p 53:53/udp -p 443:443 -p 80:80 -e IP=PublicIpOfContainer --name maj0rdnscontainer maj0rdns:latest

#3- verify the cluster

docker service ls
docker service ps maj0rdnscontainer
