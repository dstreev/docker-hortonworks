#!/bin/bash

mount -t nfs -o nfsvers=3,tcp,nolock,sync,rsize=1048576,wsize=1048576 ${SERVER}:/ /hdfs

