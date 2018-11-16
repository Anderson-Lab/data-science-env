#!/bin/bash
nohup docker run --network host --name worker_20 -t jupyterlab-docker_jupyterlab:latest dask-worker --nprocs 20 localhost:8786 > /var/log/worker_20.log 2>&1 &
