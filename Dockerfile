#Download base image ubuntu 16.04
FROM ubuntu:18.04
# Update Ubuntu Software repository

ARG PRITUNL_VERSION="*"
ENV PRITUNL_VERSION=${PRITUNL_VERSION}

ARG MONGODB_VERSION="*"
ENV MONGODB_VERSION=${MONGODB_VERSION}

LABEL MAINTAINER="Senol Colak <senol@nucleuss.com>"

COPY --chown=root:root ["dockerize.sh","/root"]
COPY --chown=root:root ["pritunl.conf","/root"]


RUN bash /root/dockerize.sh

ADD start-vpn2office-pritunl /bin/start-vpn2office-pritunl

EXPOSE 80
EXPOSE 443
EXPOSE 1194
EXPOSE 1194/udp

ENTRYPOINT ["/bin/start-vpn2office-pritunl"]

CMD ["/usr/bin/tail", "-f","/var/log/pritunl.log"]
