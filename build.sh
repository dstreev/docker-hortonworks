#!/bin/bash

echo "**** JDK-BASE *****"
docker build --tag dstreev/centos7_jdk-base:latest ./jdk-base

echo "**** IBM-BI-BASE *****"
docker build --tag dstreev/centos7_ibm-bi-base:latest ../ibm_bi/base

echo "**** HDP-BASE *****"
docker build --tag dstreev/centos7_hdp-base:latest ./hdp-base

echo "**** AMBARI ****"
docker build --tag dstreev/centos7_ambari:2 ./ambari
docker build --tag dstreev/centos7_ambari:latest ./ambari

echo "**** CentOS 6  *****"
echo "**** JDK-BASE *****"
docker build --tag dstreev/centos6_jdk-base:latest ./jdk-base-6

echo "**** HDP-BASE(6) *****"
docker build --tag dstreev/centos6_hdp-base:latest ./hdp-base-6

echo "**** AMBARI (6) ****"
docker build --tag dstreev/centos6_ambari:2 ./ambari-6
docker build --tag dstreev/centos6_ambari:latest ./ambari-6

