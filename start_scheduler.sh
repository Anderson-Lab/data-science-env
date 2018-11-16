#!/bin/bash
nohup docker run --network host --name scheduler -t jupyterlab-docker_jupyterlab:latest dask-scheduler > /var/log/scheduler.log 2>&1 &
