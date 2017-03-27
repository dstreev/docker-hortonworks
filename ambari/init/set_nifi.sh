#!/bin/bash

if [ "${NIFI_SERVER}" = "true" ]; then
    echo "Setting Nifi Repo to Version: ${NIFI_VERSION}"
    # Note: Nifi rpm's conflict with HDP rpm's at the moment. So we'll pull the
    # Nifi tarball and extract manually.
    if [ ! -f /root/nifi-${NIFI_VERSION}.${HDF_VERSION}-bin.tar.gz ]; then
        wget ${REPO_BASE_URL}/HDF/${HDF_VERSION}/nifi-${NIFI_VERSION}.${HDF_VERSION}-bin.tar.gz

        # Create HDF Location
        mkdir -p /usr/hdf/${HDF_VERSION}
        # Extract NiFi
        tar xzf /root/nifi-${NIFI_VERSION}.${HDF_VERSION}-bin.tar.gz -C /usr/hdf/${HDF_VERSION}

        # Set the current directory
        mkdir -p /usr/hdf/current
        # Create Symlink
        ln -sf /usr/hdf/${HDF_VERSION}/nifi-${NIFI_VERSION}.${HDF_VERSION} /usr/hdf/current/nifi

        # Setup Configuration Links
        mkdir -p /etc/nifi/${NIFI_VERSION}
        mv /usr/hdf/current/nifi/conf /etc/nifi/${NIFI_VERSION}/0

        ln -sf /etc/nifi/${NIFI_VERSION}/0 /usr/hdf/current/nifi/conf
        ln -sf /usr/hdf/current/nifi/conf /etc/nifi/conf

        mkdir -p /data/nifi/logs
        ln -sf /data/nifi/logs /usr/hdf/current/nifi/logs

        cp -f /root/nifi.properties /etc/nifi/conf/

    fi

    /usr/hdf/current/nifi/bin/nifi.sh start

fi
