#!/bin/bash

. ./init.sh

echo "**** HDP-BASE *****"
docker build --build-arg AMBARI_BUILD=${AMBARI_BUILD} --build-arg AMBARI_VERSION=${AMBARI_VERSION} --build-arg NIFI_BUILD=${NIFI_BUILD} --build-arg NIFI_VERSION=${NIFI_VERSION} --build-arg HDF_VERSION=${HDF_VERSION} --tag dstreev/${OS_VERSION}/hdp-base:1.0 ./hdp-base
docker build --build-arg AMBARI_BUILD=${AMBARI_BUILD} --build-arg AMBARI_VERSION=${AMBARI_VERSION} --build-arg NIFI_BUILD=${NIFI_BUILD} --build-arg NIFI_VERSION=${NIFI_VERSION} --build-arg HDF_VERSION=${HDF_VERSION} --tag dstreev/${OS_VERSION}/hdp-base ./hdp-base

echo "**** AMBARI-AGENT ****"
docker build --build-arg AMBARI_BUILD=${AMBARI_BUILD} --build-arg AMBARI_VERSION=${AMBARI_VERSION} --tag dstreev/${OS_VERSION}/ambari-agent:${AMBARI_VERSION} ./ambari-agent
docker build --build-arg AMBARI_BUILD=${AMBARI_BUILD} --build-arg AMBARI_VERSION=${AMBARI_VERSION} --tag dstreev/${OS_VERSION}/ambari-agent:latest ./ambari-agent

echo "**** AMBARI-SERVER ****"
docker build --build-arg AMBARI_BUILD=${AMBARI_BUILD} --build-arg AMBARI_VERSION=${AMBARI_VERSION} --tag dstreev/${OS_VERSION}/ambari-server:${AMBARI_VERSION} ./ambari-server
docker build --build-arg AMBARI_BUILD=${AMBARI_BUILD} --build-arg AMBARI_VERSION=${AMBARI_VERSION} --tag dstreev/${OS_VERSION}/ambari-server ./ambari-server

echo "**** HDP-REPO *****"
docker build --build-arg AMBARI_BUILD=${AMBARI_BUILD} --build-arg AMBARI_VERSION=${AMBARI_VERSION} --build-arg NIFI_BUILD=${NIFI_BUILD} --build-arg NIFI_VERSION=${NIFI_VERSION} --build-arg HDF_VERSION=${HDF_VERSION} --tag dstreev/hdp-repo:1.0 ./hdp-repo
docker build --build-arg AMBARI_BUILD=${AMBARI_BUILD} --build-arg AMBARI_VERSION=${AMBARI_VERSION} --build-arg NIFI_BUILD=${NIFI_BUILD} --build-arg NIFI_VERSION=${NIFI_VERSION} --build-arg HDF_VERSION=${HDF_VERSION} --tag dstreev/hdp-repo ./hdp-repo

echo "***** NIFI ****"
docker build --build-arg AMBARI_VERSION=${AMBARI_VERSION} --build-arg NIFI_BUILD=${NIFI_BUILD} --build-arg NIFI_VERSION=${NIFI_VERSION} --build-arg HDF_VERSION=${HDF_VERSION} --tag dstreev/${OS_VERSION}/nifi:${NIFI_VERSION} ./nifi
docker build --build-arg AMBARI_VERSION=${AMBARI_VERSION} --build-arg NIFI_BUILD=${NIFI_BUILD} --build-arg NIFI_VERSION=${NIFI_VERSION} --build-arg HDF_VERSION=${HDF_VERSION} --tag dstreev/${OS_VERSION}/nifi ./nifi
