#!/bin/bash
source $1
echo $PORT
echo $NAME
nohup docker run --name $NAME -p 0.0.0.0:$PORT:8888 -v DataVolume1:/datavolume1 -t jupyterlab-docker_jupyterlab:latest jupyter lab --LabApp.base_url=$NAME --ip=0.0.0.0 --port=8888 --no-browser --notebook-dir=/opt/app/data --allow-root > /var/log/$NAME.log 2>&1 &
