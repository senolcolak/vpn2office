# vpn2office

wherever you work you can reach internet via your office and access the office resources.

The project aims to use l2tp VPN and Openvpn(pritunl) softwares to make it possible to reach your office ressources and reach internet from your Office network (for some IP restrictions)


Since the Homeoffice become popular and mendatory, some small companies would not survive if they can't do HomeOffice. Homeoffice equipments and softwares are sometimes incredibly expensive, This solution uses all opensource software.

The system to run needs 3 components:
1. Office Hardware (Office router, rapberry-pi, mikrotik, Windows/linux server)
2. Cloud Virtual Server (2GB Ram 20 Gb disk, 1 ip address, non-container)
3. Client Software - Openvpn client (any openvpn client will work)

Users
 who will connect to the Office network needs to install Openvpn client

Office
 Raspberry-pi 
 Mikrotik 
 L2tp VPN Client (windows)
 

![vpn2office](https://github.com/nsrvs/vpn2office/blob/master/vpn2office.png)



1. Buy HW (Miktorik/Raspberry-pi)


2. Cloud Virtual Server installation

* install docker 
Depending on your Virtual Server Operating system install docker on your VPS

https://docs.docker.com/install/linux/docker-ce/ubuntu/

https://docs.docker.com/install/linux/docker-ce/centos/


* install vpn2office container,

```
$ sudo modprobe ip_tables

$ sudo mkdir -p /srv/docker0/pritunl/{mongodb,pritunl}

$ sudo docker run \
--name=vpn2office \
--detach \
--privileged \
--network=host \
--restart=always \
-v /srv/docker0/pritunl/mongodb:/var/lib/mongodb \
-v /srv/docker0/pritunl/pritunl:/var/lib/pritunl \
scolak/vpn2office 
```
from the command line type the following commands to set l2tp VPN username and password

$ sudo docker exec -it vpn2office sh setpw_vpnuser.sh <NEW-PASSWORD>

[answer yes to update the password]

$ sudo docker exec -it vpn2office cat /etc/ipsec.secrets

%any %any : PSK "PM9j49s3taR5WtVgbhbX"

[here shared key is PM9j49s3taR5WtVgbhbX ]

you need three parameter to connect l2tp vpn

username: vpnuser

password: you-just-set

shared-key: PM9j49s3taR5WtVgbhbX <-- this is different on your image

$ sudo docker exec -it vpn2office ip r add via 192.168.42.10 dev ppp0

here if your office network is 192.168.0.0/24 (ie. if you have a ip 192.168.0.183 and net mask 255.255.255.0) that will look like the following

$ sudo docker exec -it vpn2office ip r add 192.168.0.0/24 via 192.168.42.10 dev ppp0

Plus you have VPN connection for your Employees/Clients/Users to reach office network

from web type the url https://docker-host-name-or-ip username password pritunl/pritunl (please change immediately)

pritunl is great for openvpn installations, just give a password and start creating the following Organization -> any name will work like office user -> add as many users as you want server -> create a server any with udp port (i.e. 40099) attach server to organization office start remove the 0/0 route from the route list add route 192.168.0.0/24 (your office network)

This is the end of server part.

each user has a key, plus if you wan you can enable 2 factor auth, for your Employees/Users.

download the key and install a openvpn client, all of the clients will work..

3. Office Client installation

to-be-done..

