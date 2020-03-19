# vpn2office

wherever you work you can reach internet via your office and access the office resources.

The project aims to use l2tp VPN and Openvpn(pritunl) softwares to make it possible to reach your office ressources and reach internet from your Office network (for some IP restrictions)


Since the Homeoffice become popular and mendatory some small companies would not survive if they can't do HomeOffice. Homeoffice equipments and softwares are sometimes incredibly expensive, This solution uses all opensource software.

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
