#!/bin/bash

. ./init.sh

docker push dstreev/${OS_VERSION}_hdp-base:1.0
docker push dstreev/${OS_VERSION}_hdp-base

docker push dstreev/${OS_VERSION}_ambari-agent:${AMBARI_VERSION}
docker push dstreev/${OS_VERSION}_ambari-agent

docker push dstreev/${OS_VERSION}_ambari-server:${AMBARI_VERSION}
docker push dstreev/${OS_VERSION}_ambari-server

docker push dstreev/hdp-repo:1.0
docker push dstreev/hdp-repo

docker push dstreev/${OS_VERSION}_nifi:${NIFI_VERSION}
docker push dstreev/${OS_VERSION}_nifi
