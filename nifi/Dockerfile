FROM dstreev/ambari-agent:2.4.2.0

LABEL maintainer "David W. Streever<david@streever.com>"

RUN yum --disablerepo=Updates-ambari-2.4.2.0 -y install postgresql postgresql-server postgresql-contrib

RUN mkdir -p /usr/hdf/nifi

WORKDIR /usr/hdf/nifi

RUN wget http://s3.amazonaws.com/public-repo-1.hortonworks.com/HDF/2.1.1.0/nifi-1.1.0.2.1.1.0-2-bin.tar.gz

RUN tar -xzvf nifi-1.1.0.2.1.1.0-2-bin.tar.gz && rm nifi-1.1.0.2.1.1.0-2-bin.tar.gz
RUN ln -s nifi-1.1.0.2.1.1.0-2 current

# Change to Nifi 'current' Directory (NIFI_HOME)
WORKDIR /usr/hdf/nifi/current
RUN rm -rf conf

# Move Configs to /etc/nifi/conf via symlink
RUN mkdir -p /etc/nifi/1.1.0.2.1.1.0-2/0
RUN ln -s /etc/nifi/1.1.0.2.1.1.0-2/0 conf
RUN ln -s /var/log/nifi logs
WORKDIR /etc/nifi
RUN ln -s /usr/hdf/nifi/current/conf conf

COPY ./init/nifi/conf/*.* conf/
COPY ./init/nifi/bin/nifi-env.sh bin/

# Get a newer jdbc driver
RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.40.tar.gz
RUN tar -xvzf mysql-connector-java-5.1.40.tar.gz
RUN mkdir -p /usr/share/java
RUN cp mysql-connector-java-5.1.40/mysql-connector-java-5.1.40-bin.jar /usr/share/java/mysql-connector-java.jar
RUN rm -rf mysql-connector-java-5.1.40*

# Supervisord Config
COPY ./init/supervisord.ini /etc/supervisord.d/hdp.ini

EXPOSE 8080

VOLUME ["/var/log/nifi"]
