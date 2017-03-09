FROM dstreev/centos7_hdp-base

LABEL maintainer "David W. Streever<david@streever.com>"

ARG AMBARI_VERSION
ENV AMBARI_VERSION $AMBARI_VERSION
ARG AMBARI_BUILD
ENV AMBARI_BUILD $AMBARI_BUILD
ARG OS_VERSION
ENV OS_VERSION $OS_VERSION

# Ambari Agent
RUN wget http://s3.amazonaws.com/public-repo-1.hortonworks.com/ambari/$OS_VERSION/2.x/updates/$AMBARI_VERSION/ambari/ambari-agent-$AMBARI_VERSION-$AMBARI_BUILD.x86_64.rpm
RUN rpm -ivh ambari-agent-$AMBARI_VERSION-$AMBARI_BUILD.x86_64.rpm && rm ambari-agent-$AMBARI_VERSION-$AMBARI_BUILD.x86_64.rpm

COPY ./init/ambari.repo /etc/yum.repos.d/ambari.repo

# Manual Registration for Ambari Agent config
COPY ./init/ambari-agent.ini /etc/ambari-agent/conf/ambari-agent.ini
#COPY ./init/ambari-agent /etc/init.d/ambari-agent

WORKDIR /root

COPY ./ssh/id_rsa .ssh/
COPY ./ssh/id_rsa.pub .ssh/
COPY ./ssh/id_rsa.pub .ssh/authorized_keys

VOLUME ["/data","/usr/hdp","/var/log/hadoop","/var/log/hadoop-yarn","/var/log/hadoop-mapreduce","/var/log/hive","/var/log/hbase","/var/log/oozie","/var/log/falcon","/var/log/atlas","/var/log/zookeeper","/var/log/ambari-infra-solr","/var/log/kafka"]

# Supervisord Config
COPY ./init/supervisord.ini /etc/supervisord.d/hdp.ini
COPY ./init/set_instance.sh /root/
RUN chmod 700 /root/set_instance.sh

CMD ["/usr/bin/supervisord"]
