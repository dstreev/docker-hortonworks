FROM centos:centos6

LABEL maintainer "David W. Streever<david@streever.com>"

RUN yum -y install epel-release

# Update the OS before continuing and install the yum-utils module
RUN yum -y update && yum -y install yum-utils unzip wget gettext && yum -y install less && yum -y install net-tools && yum -y install iproute && yum -y install openssl openssh-server openssh-clients passwd && yum -y install supervisor && yum -y install ntp && yum -y install ansible && yum -y install pdsh

# Generate Host Key for sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

# Supervisord Config
COPY ./init/supervisord.ini /etc/supervisord.d/hdp.ini

# JDK
WORKDIR /tmp
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.rpm
RUN rpm -ivh jdk-8u161-linux-x64.rpm && rm jdk-8u161-linux-x64.rpm

# Download and install the Hadoop CLI
RUN wget https://github.com/dstreev/hadoop-cli/releases/download/1.0.7.2.7-bin/hadoop-cli-1.0.7-SNAPSHOT-2.7.tar.gz
RUN tar -xzvf hadoop-cli-1.0.7-SNAPSHOT-2.7.tar.gz
RUN hadoop-cli-2.7/setup.sh

WORKDIR /root

RUN mkdir .ssh
RUN chmod 600 .ssh

COPY ./ssh/id_rsa .ssh/
COPY ./ssh/id_rsa.pub .ssh/
COPY ./ssh/id_rsa.pub .ssh/authorized_keys

RUN chmod 600 ./.ssh/id_rsa
RUN chmod 600 ./.ssh/id_rsa.pub
RUN chmod 600 ./.ssh/authorized_keys


EXPOSE 22

CMD ["/usr/bin/supervisord"]
