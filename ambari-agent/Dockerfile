FROM centos:centos7

LABEL maintainer "David W. Streever<david@streever.com>"

RUN yum -y install epel-release

# Update the OS before continuing and install the yum-utils module
RUN yum -y update && yum -y install yum-utils unzip wget && yum -y install less && yum -y install net-tools && yum -y install iproute && yum -y install openssl openssh-server passwd && yum -y install supervisor && yum -y install ntp && yum -y install ansible && yum -y install pdsh

# Generate Host Key for sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

# Supervisord Config
COPY ./init/supervisord.ini /etc/supervisord.d/hdp.ini
COPY ./init/ambari.repo /etc/yum.repos.d/ambari.repo

# JDK
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.rpm
RUN rpm -ivh jdk-8u121-linux-x64.rpm && rm jdk-8u121-linux-x64.rpm

# Download and install the Hadoop CLI
RUN wget https://github.com/dstreev/hadoop-cli/releases/download/1.0.7.2.7-bin/hadoop-cli-1.0.7-SNAPSHOT-2.7.tar.gz
RUN tar -xzvf hadoop-cli-1.0.7-SNAPSHOT-2.7.tar.gz
RUN hadoop-cli-2.7/setup.sh

# Ambari Agent
RUN wget http://s3.amazonaws.com/public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.4.2.0/ambari/ambari-agent-2.4.2.0-136.x86_64.rpm
RUN rpm -ivh ambari-agent-2.4.2.0-136.x86_64.rpm && rm ambari-agent-2.4.2.0-136.x86_64.rpm

# Manual Registration for Ambari Agent config
COPY ./init/ambari-agent.ini /etc/ambari-agent/conf/ambari-agent.ini

WORKDIR /root

RUN mkdir .ssh
RUN chmod 600 .ssh

COPY ./ssh/id_rsa .ssh/
COPY ./ssh/id_rsa.pub .ssh/
COPY ./ssh/id_rsa.pub .ssh/authorized_keys

VOLUME ["/data","/usr/hdp","/var/log/hadoop","/var/log/hadoop-yarn","/var/log/hadoop-mapreduce","/var/log/hive","/var/log/hbase","/var/log/oozie","/var/log/falcon","/var/log/atlas","/var/log/zookeeper","/var/log/ambari-infra-solr","/var/log/kafka"]

CMD ["/usr/bin/supervisord"]
