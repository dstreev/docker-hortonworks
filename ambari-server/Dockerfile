FROM dstreev/ambari-agent

LABEL maintainer "David W. Streever<david@streever.com>"

ARG AMBARI_VERSION
ENV AMBARI_VERSION $AMBARI_VERSION
ARG AMBARI_BUILD
ENV AMBARI_BUILD $AMBARI_BUILD

RUN yum --disablerepo=Updates-ambari-$AMBARI_VERSION -y install postgresql postgresql-server postgresql-contrib

# Ambari Agent
RUN wget http://s3.amazonaws.com/public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/$AMBARI_VERSION/ambari/ambari-server-$AMBARI_VERSION-$AMBARI_BUILD.x86_64.rpm
RUN rpm -ivh ambari-server-$AMBARI_VERSION-$AMBARI_BUILD.x86_64.rpm && rm ambari-server-$AMBARI_VERSION-$AMBARI_BUILD.x86_64.rpm

# Get a newer jdbc driver
RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.40.tar.gz
RUN tar -xvzf mysql-connector-java-5.1.40.tar.gz
RUN mkdir -p /usr/share/java
RUN cp mysql-connector-java-5.1.40/mysql-connector-java-5.1.40-bin.jar /usr/share/java/mysql-connector-java.jar
RUN rm -rf mysql-connector-java-5.1.40*

# Link Ambari to the MySql JDBC Driver
RUN ambari-server setup --jdbc-driver=/usr/share/java/mysql-connector-java.jar --jdbc-db=mysql

# Manually configuring Ambari Server
COPY ./init/ambari.properties /etc/ambari-server/conf/ambari.properties
COPY ./init/password.dat /etc/ambari-server/conf/password.dat
#COPY ./init/ambari-server /etc/init.d/ambari-server

# Supervisord Config
COPY ./init/supervisord.ini /etc/supervisord.d/hdp.ini
