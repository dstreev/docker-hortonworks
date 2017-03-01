FROM dstreev/ambari-agent

LABEL maintainer "David W. Streever<david@streever.com>"

ARG AMBARI_VERSION
ENV AMBARI_VERSION $AMBARI_VERSION
ARG HDF_VERSION
ENV HDF_VERSION $HDF_VERSION
ARG NIFI_VERSION
ENV NIFI_VERSION $NIFI_VERSION
ARG NIFI_BUILD
ENV NIFI_BUILD $NIFI_BUILD

RUN mkdir -p /usr/hdf/nifi

WORKDIR /usr/hdf/nifi

RUN wget http://s3.amazonaws.com/public-repo-1.hortonworks.com/HDF/$NIFI_VERSION/nifi-$HDF_VERSION.$NIFI_VERSION-$NIFI_BUILD-bin.tar.gz

RUN tar -xzvf nifi-$HDF_VERSION.$NIFI_VERSION-$NIFI_BUILD-bin.tar.gz && rm nifi-$HDF_VERSION.$NIFI_VERSION-$NIFI_BUILD-bin.tar.gz
RUN ln -s nifi-$HDF_VERSION.$NIFI_VERSION-$NIFI_BUILD current

# Change to Nifi 'current' Directory (NIFI_HOME)
WORKDIR /usr/hdf/nifi/current
RUN rm -rf conf

# Move Configs to /etc/nifi/conf via symlink
RUN mkdir -p /etc/nifi/$HDF_VERSION.$NIFI_VERSION-$NIFI_BUILD/0
RUN ln -s /etc/nifi/$HDF_VERSION.$NIFI_VERSION-$NIFI_BUILD/0 conf
RUN ln -s /var/log/nifi logs
WORKDIR /etc/nifi
RUN ln -s /usr/hdf/nifi/current/conf conf

COPY ./init/nifi/conf/*.* conf/
COPY ./init/nifi/bin/nifi-env.sh bin/

# Supervisord Config
COPY ./init/supervisord.ini /etc/supervisord.d/hdp.ini

EXPOSE 8080

VOLUME ["/var/log/nifi"]
