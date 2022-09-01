# maj0rdns
An smart DNS for bypassing geo restorations of specific various web services 

Hint : this service should be only available to a specefic geo or specefic ip addresses to prevent attacks and etc problem

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


#IrAccess

to restrict the service to Iran ip address run the iraccess.sh

./iraccess.sh

#Cluster Mode ( docker swarm - single node ) 

after builing the container to run a cluster do the following 

#1- swarm init

docker swarm init

#2- create docker swarm service 

docker service create --cap-add=NET_ADMIN -p 53:53/udp -p 443:443 -p 80:80 -e IP=PublicIpOfContainer --name maj0rdnscontainer maj0rdns:latest


#3- scale the service to 5 instances

docker service scale maj0rdnscontainer=5


#4- verify the cluster

docker service ls

docker service ps maj0rdnscontainer

![image](https://user-images.githubusercontent.com/46486478/187826199-498a76f1-1526-4b3d-a70a-ccc3eff80bf3.png)


#5- Verify the service 

![image](https://user-images.githubusercontent.com/46486478/187826236-ddf2e475-bb4d-459a-8dc3-4f8be36f6685.png)


