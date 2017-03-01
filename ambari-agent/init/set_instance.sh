#!/bin/bash

if [ -f /etc/ambari-agent/conf/ambari-agent.ini ]; then
  echo "Setting Ambari Agent Instance Reference: ${AMBARI_INSTANCE}"
  /usr/bin/envsubst < /etc/ambari-agent/conf/ambari-agent.ini > /etc/ambari-agent/conf/ambari-agent.ini
fi

if [ -f /etc/ambari-server/conf/ambari.properties ]; then
  echo "Setting Ambari Server Instance Reference: ${AMBARI_INSTANCE}"
  /usr/bin/envsubst < /etc/ambari-server/conf/ambari.properties > /etc/ambari-server/conf/ambari.properties
fi
