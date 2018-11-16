#!/bin/bash
sudo docker ps -aq --no-trunc -f status=exited | xargs docker rm
