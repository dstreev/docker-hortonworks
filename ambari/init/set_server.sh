#!/bin/bash

if [ "${AMBARI_SERVER}" = "true" ]; then
    echo "Setting Ambari Repo to Version: ${AMBARI_VERSION}"
    wget ${REPO_BASE_URL}/ambari/centos7/2.x/updates/${AMBARI_VERSION}/ambari.repo -O /etc/yum.repos.d/ambari.repo
    yum -y install mariadb

    yum -y install ambari-server
    echo "Setting Ambari Server Instance Reference: ${AMBARI_INSTANCE}"
#    /usr/bin/envsubst < /root/ambari.properties > /etc/ambari-server/conf/ambari.properties
#    cp /root/password.dat /etc/ambari-server/conf/password.dat
#    ambari-server setup --jdbc-driver=/usr/share/java/mysql-connector-java.jar --jdbc-db=mysql
    # Initialize the users for the dbs
    mysql -u root --password=hortonworks -h db.hdp.local < /root/init_db_users.sql
    # Create the databases for this HDP environment
    mysql -u root --password=hortonworks -h db.hdp.local -e 'create database ambari_${AMBARI_INSTANCE};'
    mysql -u root --password=hortonworks -h db.hdp.local -e 'create database hive_${AMBARI_INSTANCE};'
    mysql -u root --password=hortonworks -h db.hdp.local -e 'create database oozie_${AMBARI_INSTANCE};'
    mysql -u root --password=hortonworks -h db.hdp.local -e 'create database ranger_${AMBARI_INSTANCE};'
    mysql -u root --password=hortonworks -h db.hdp.local -e 'create database ranger_kms_${AMBARI_INSTANCE};'
    mysql -u root --password=hortonworks -h db.hdp.local -e 'create database druid_${AMBARI_INSTANCE};'
    mysql -u root --password=hortonworks -h db.hdp.local -e 'create database superset_${AMBARI_INSTANCE};'
    # Build the Schema for Ambari
    mysql -u root --password=hortonworks -h db.hdp.local ambari_${AMBARI_INSTANCE} < /var/lib/ambari-server/resources/Ambari-DDL-MySQL-CREATE.sql

    # Setup Ambari and Cluster JDK
    /usr/sbin/ambari-server setup -s --java-home=/usr/java/default
    # Setup Ambari Keystore
    /usr/sbin/ambari-server setup -v -g -s --master-key=hortonworks --master-key-persist=true --truststore-type=jceks --truststore-path=/etc/ambari-server/conf/password.jceks --truststore-password=hortonworks
    # Setup the Database JDBC Driver for Ambari
    /usr/sbin/ambari-server setup -v -g -s --jdbc-driver=/usr/share/java/mysql-connector-java.jar --jdbc-db=mysql
    # Setup the Ambari Connection to the Database
    /usr/sbin/ambari-server setup -v -g -s --database=mysql --databasehost="db.hdp.local" --databaseport=3306 --databasename=ambari_${AMBARI_INSTANCE} --databaseusername=ambari --databasepassword=hortonworks

    /usr/sbin/ambari-server start

    # Install and Start Agent
    yum -y install ambari-agent
    echo "Setting Ambari Agent Instance Reference: ${AMBARI_INSTANCE}"
    /usr/bin/envsubst < /root/ambari-agent.ini > /etc/ambari-agent/conf/ambari-agent.ini
    ambari-agent start
fi
