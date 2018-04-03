#!/bin/bash

docker push dstreev/centos7_jdk-base
docker push dstreev/centos7_ibm-bi-base

docker push dstreev/centos7_hdp-base

docker push dstreev/centos7_ambari:2
docker push dstreev/centos7_ambari:latest

docker push dstreev/centos6_hdp-base:latest

docker push dstreev/centos6_ambari:2
docker push dstreev/centos6_ambari:latest
