FROM dstreev/ambari-agent:2.4.2.0

LABEL maintainer "David W. Streever<david@streever.com>"

RUN yum --disablerepo=Updates-ambari-2.4.2.0 -y install postgresql postgresql-server postgresql-contrib

RUN wget http://s3.amazonaws.com/public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.4.2.0/ambari/ambari-server-2.4.2.0-136.x86_64.rpm
RUN rpm -ivh ambari-server-2.4.2.0-136.x86_64.rpm && rm ambari-server-2.4.2.0-136.x86_64.rpm

# Get a newer jdbc driver
RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.40.tar.gz
RUN tar -xvzf mysql-connector-java-5.1.40.tar.gz
RUN mkdir -p /usr/share/java
RUN cp mysql-connector-java-5.1.40/mysql-connector-java-5.1.40-bin.jar /usr/share/java/mysql-connector-java.jar
RUN rm -rf mysql-connector-java-5.1.40*

# Supervisord Config
COPY ./init/supervisord.ini /etc/supervisord.d/hdp.ini

# Link Ambari to the MySql JDBC Driver
RUN ambari-server setup --jdbc-driver=/usr/share/java/mysql-connector-java.jar --jdbc-db=mysql

# Process currently doesn't work.
#RUN /usr/sbin/ambari-server setup --java-home=/usr/java/default --database=mysql --databasehost="db.hdp.local" --databaseport=3306 --databasename=ambari --databaseusername=ambari --databasepassword=hortonworks --jdbc-driver=/usr/share/java/mysql-connector-java.jar --jdbc-db=mysql --master-key=hortonworks --master-key-persist=true --truststore-type=jceks --truststore-path=/etc/ambari-server/conf/password.jceks --truststore-password=hortonworks -v -g

# Manually configuring Ambari Server
COPY ./init/ambari.properties /etc/ambari-server/conf/ambari.properties
COPY ./init/password.dat /etc/ambari-server/conf/password.dat
