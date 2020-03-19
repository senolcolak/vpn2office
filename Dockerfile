#Download base image ubuntu 16.04
FROM ubuntu:18.04
# Update Ubuntu Software repository

ARG PRITUNL_VERSION="*"
ENV PRITUNL_VERSION=${PRITUNL_VERSION}

ARG MONGODB_VERSION="*"
ENV MONGODB_VERSION=${MONGODB_VERSION}

LABEL MAINTAINER="Senol Colak <senol@nucleuss.com>"

COPY --chown=root:root ["docker-install.sh", "/root"]
COPY --chown=root:root ["l2tp-install.sh","/root"]
RUN bash /root/docker-install.sh
RUN bash /root/l2tp-install.sh

ADD start-pritunl /bin/start-pritunl

EXPOSE 80
EXPOSE 443
EXPOSE 1194
EXPOSE 1194/udp
EXPOSE 1701
EXPOSE 4500
EXPOSE 500

ENTRYPOINT ["/bin/start-pritunl"]

CMD ["/usr/bin/tail", "-f","/var/log/pritunl.log"]
