FROM dstreev/centos7_hdp-base

LABEL maintainer "David W. Streever<david@streever.com>"

#ARG AMBARI_VERSION
#ENV AMBARI_VERSION $AMBARI_VERSION
#ARG AMBARI_BUILD
#ENV AMBARI_BUILD $AMBARI_BUILD
#ARG OS_VERSION
#ENV OS_VERSION $OS_VERSION

WORKDIR /root

# Install Docker-CE
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum makecache fast
RUN yum -y install docker-ce

# Get a newer jdbc driver
RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.40.tar.gz
RUN tar -xvzf mysql-connector-java-5.1.40.tar.gz
RUN mkdir -p /usr/share/java
RUN cp mysql-connector-java-5.1.40/mysql-connector-java-5.1.40-bin.jar /usr/share/java/mysql-connector-java.jar
RUN rm -rf mysql-connector-java-5.1.40*

COPY ./init/ambari-agent.ini ambari-agent.ini
COPY ./init/nifi.properties nifi.properties
COPY ./init/init_db_users.sql init_db_users.sql
COPY ./init/init_dbs.sql init_dbs.sql

COPY ./ssh/id_rsa .ssh/
COPY ./ssh/id_rsa.pub .ssh/
COPY ./ssh/id_rsa.pub .ssh/authorized_keys

VOLUME ["/data","/usr/hdp","/var/log/hadoop","/var/log/hadoop-yarn","/var/log/hadoop-mapreduce","/var/log/hive","/var/log/hbase","/var/log/oozie","/var/log/falcon","/var/log/atlas","/var/log/zookeeper","/var/log/ambari-infra-solr","/var/log/kafka"]

# Supervisord Config
COPY ./init/supervisord.ini /etc/supervisord.d/hdp.ini
COPY ./init/set_agent.sh /root/
COPY ./init/set_server.sh /root/
COPY ./init/set_nifi.sh /root/
RUN chmod 700 /root/set_agent.sh
RUN chmod 700 /root/set_server.sh
RUN chmod 700 /root/set_nifi.sh

# Ambari and Nifi UI Port
EXPOSE 8080
# Hive Port
EXPOSE 10000
# Storm UI Port
EXPOSE 8744
# Storm Log Viewer UI Port
EXPOSE 8000
# Oozie
EXPOSE 11000


CMD ["/usr/bin/supervisord"]
