set -ex

apt-get update -q
apt-get install -y locales iptables wget gnupg2 python net-tools bridge-utils openvpn

echo "deb https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" > /etc/apt/sources.list.d/mongodb-org-4.0.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 9DA31620334BD75D9DCB49F368818C72E52529D4

echo "deb http://repo.pritunl.com/stable/apt bionic main" > /etc/apt/sources.list.d/pritunl.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A

locale-gen en_US en_US.UTF-8
dpkg-reconfigure locales
ln -sf /usr/share/zoneinfo/UTC /etc/localtime
#apt-get update
apt-get upgrade -y -q
apt-get dist-upgrade -y -q

#wget --quiet https://github.com/pritunl/pritunl/releases/download/${PRITUNL_VERSION}/pritunl_${PRITUNL_VERSION}-0ubuntu1.bionic_amd64.deb
#wget --quiet https://github.com/pritunl/pritunl/releases/download/1.29.2276.91/pritunl_1.29.2276.91-0ubuntu1.bionic_amd64.deb

#dpkg -i pritunl_${PRITUNL_VERSION}-0ubuntu1.bionic_amd64.deb || apt-get -f -y install
#rm pritunl_${PRITUNL_VERSION}-0ubuntu1.bionic_amd64.deb
#dpkg -i pritunl_1.29.2276.91-0ubuntu1.bionic_amd64.deb||apt-get -f -y install
#rm pritunl_1.29.2276.91-0ubuntu1.bionic_amd64.deb
apt update
#apt -y -q install pritunl
#if [ "${MONGODB_VERSION}" != "no" ]; then
#    apt-get -y install mongodb-org=${MONGODB_VERSION};
#fi
apt --assume-yes install pritunl mongodb-server

apt-get --purge autoremove -y wget
apt-get clean
apt-get -y -q autoclean
apt-get -y -q autoremove
rm -rf /tmp/*
