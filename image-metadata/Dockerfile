FROM centos:centos7

LABEL maintainer "David W. Streever<david@streever.com>"

RUN yum -y install epel-release

# Update the OS before continuing and install the yum-utils module
RUN yum -y update && yum -y install yum-utils unzip wget gettext && yum -y install less && yum -y install net-tools && yum -y install iproute && yum -y install openssl openssh-server openssh-clients passwd && yum -y install supervisor && yum -y install ntp && yum -y install ansible && yum -y install pdsh && yum -y install nfs-utils

# Generate Host Key for sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

# Supervisord Config
COPY ./init/supervisord.ini /etc/supervisord.d/image.ini
COPY ./init/set_mount.sh /root/

RUN yum -y install perl-Image-ExifTool

RUN mkdir /hdfs

COPY ./ssh/id_rsa .ssh/
COPY ./ssh/id_rsa.pub .ssh/
COPY ./ssh/id_rsa.pub .ssh/authorized_keys

EXPOSE 22

VOLUME ["/hdfs"]

CMD ["/usr/bin/supervisord"]
