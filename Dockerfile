#Download base image ubuntu 16.04
FROM ubuntu:18.04
# Update Ubuntu Software repository
RUN apt-get update
# install Pritunl Openvpn
RUN echo "deb http://repo.pritunl.com/stable/apt bionic main" | sudo tee /etc/apt/sources.list.d/pritunl.list
RUN echo "deb https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse
" >/etc/apt/sources.list.d/mongodb-org-4.0.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
RUN apt update
RUN apt --assume-yes install pritunl mongodb-server


##install l2tp vpn
RUN apt install -y wget
RUN wget https://git.io/vpnsetup -O vpnsetup.sh && sudo sh vpnsetup.sh
