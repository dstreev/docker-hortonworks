#!/bin/bash

echo "**** HDP-BASE *****"
docker build --tag dstreev/centos7_hdp-base ./hdp-base

echo "**** AMBARI ****"
docker build --tag dstreev/centos7_ambari:2 ./ambari
docker build --tag dstreev/centos7_ambari:latest ./ambari

