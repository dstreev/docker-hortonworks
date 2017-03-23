#!/bin/bash

if [ "${AMBARI_SERVER}" = "true" ]; then
    echo "Setting Ambari Repo to Version: ${AMBARI_VERSION}"
    wget ${REPO_BASE_URL}/ambari/centos7/2.x/updates/${AMBARI_VERSION}/ambari.repo -O /etc/yum.repos.d/ambari.repo

    yum -y install ambari-server
    echo "Setting Ambari Server Instance Reference: ${AMBARI_INSTANCE}"
    /usr/bin/envsubst < /root/ambari.properties > /etc/ambari-server/conf/ambari.properties
    cp /root/password.dat /etc/ambari-server/conf/password.dat
    ambari-server setup --jdbc-driver=/usr/share/java/mysql-connector-java.jar --jdbc-db=mysql
    ambari-server start

    # Install and Start Agent
    yum -y install ambari-agent
    echo "Setting Ambari Agent Instance Reference: ${AMBARI_INSTANCE}"
    /usr/bin/envsubst < /root/ambari-agent.ini > /etc/ambari-agent/conf/ambari-agent.ini
    ambari-agent start
fi
