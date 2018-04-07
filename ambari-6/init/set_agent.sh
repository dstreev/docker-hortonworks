#!/bin/bash

if [ "${AMBARI_AGENT}" = "true" ]; then
    echo "Setting Ambari Repo to Version: ${AMBARI_VERSION}"
    wget ${REPO_BASE_URL}/ambari/centos6/2.x/updates/${AMBARI_VERSION}/ambari.repo -O /etc/yum.repos.d/ambari.repo

    yum -y install ambari-agent
    echo "Setting Ambari Agent Instance Reference: ${AMBARI_INSTANCE}"
    /usr/bin/envsubst < /root/ambari-agent.ini > /etc/ambari-agent/conf/ambari-agent.ini
    ambari-agent start
fi
