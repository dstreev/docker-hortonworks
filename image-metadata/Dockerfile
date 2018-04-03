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

# JDK
WORKDIR /tmp
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.rpm
RUN rpm -ivh jdk-8u121-linux-x64.rpm && rm jdk-8u121-linux-x64.rpm

WORKDIR /home/root
COPY ./init/read.py .
RUN chmod +x read.py

RUN useradd dstreev

EXPOSE 22

VOLUME ["/hdfs"]

CMD ["/usr/bin/supervisord"]
