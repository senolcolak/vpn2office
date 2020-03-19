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
mkdir -p /gluster/docker0/pritunl/{mongodb,pritunl}
touch gluster/docker0/pritunl/pritunl.conf

docker run \
    --name=vpn2office \
    --detach \
    --privileged \
    --network=host \
    --restart=always \
    -v /gluster/docker0/pritunl/mongodb:/var/lib/mongodb \
    -v /gluster/docker0/pritunl/pritunl:/var/lib/pritunl \
    -v /gluster/docker0/pritunl/pritunl.conf:/etc/pritunl.conf \
    scolak/vpn2office

Then you can login to your pritunl web ui at https://docker-host-address

Username: pritunl Password: pritunl


