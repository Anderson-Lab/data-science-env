#!/bin/bash
source $1
echo $PORT
echo $NAME
nohup docker run --name $NAME -e BASEURL=$NAME -p 0.0.0.0:$PORT:8888 -t jupyterlabdocker_jupyterlab:latest > /var/log/$NAME.log 2>&1 &
