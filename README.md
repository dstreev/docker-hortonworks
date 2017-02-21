# docker-hdp
HDP Cluster Deployment via Docker


# Steps

1. Build Centos7:sshd
2. Build HDP Base
3. Set environment variable for DATA_GROUP and LAUNCH_DATE
```
export DATA_GROUP=dk_01
export LAUNCH_DATE=\`date +%Y-%m-%d_%H_%M\`

```
3. Run docker-compose build
```
docker-compose build
```
4. Run docker-compose up -d
```
docker-compose up -d
```

## Initializing Ambari Server

1. Create User on MySql DB for Ambari Server.
2. Run the Ambari Server Create Scripts.
3. Launch Ambari-Server Setup.