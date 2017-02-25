#!/bin/bash

docker build --tag dstreev/ambari-agent:2.4.2.0 ./ambari-agent
docker build --tag dstreev/hdp-repo ./hdp-repo
docker build --tag dstreev/ambari-server:2.4.2.0 ./ambari-server

docker build --tag dstreev/ambari-agent:latest ./ambari-agent
docker build --tag dstreev/ambari-server:latest ./ambari-server

docker build --tag dstreev/nifi:2.1.1.0 ./nifi
docker build --tag dstreev/nifi:latest ./nifi
