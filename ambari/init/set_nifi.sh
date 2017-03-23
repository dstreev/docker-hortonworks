#!/bin/bash

if [ "${NIFI_SERVER}" = "true" ]; then
    echo "Setting Nifi Repo to Version: ${NIFI_VERSION}"
    # Note: Nifi rpm's conflict with HDP rpm's at the moment. So we'll pull the
    # Nifi tarball and extract manually.
    if [ -d /root/
    wget ${REPO_BASE_URL}/HDF/centos7/2.x/updates/${NIFI_VERSION}/hdf.repo -O /root/hdf.repo

    #yum -y install nifi
    #/usr/hdf/current/nifi/bin/nifi.sh start

fi
