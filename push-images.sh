#!/bin/bash

. ./init.sh

docker push dstreev/hdp-base:1.0
docker push dstreev/hdp-base

docker push dstreev/ambari-agent:${AMBARI_VERSION}
docker push dstreev/ambari-agent

docker push dstreev/ambari-server:${AMBARI_VERSION}
docker push dstreev/ambari-server

docker push dstreev/hdp-base:1.0
docker push dstreev/hdp-base

docker push dstreev/nifi:${NIFI_VERSION}
docker push dstreev/nifi
