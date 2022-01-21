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
