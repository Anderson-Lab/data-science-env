#!/bin/bash
source $1
grep token= /var/log/$NAME.log | egrep -v LabApp | awk -F token= '{print $2}' > /var/log/$NAME.token
cat /var/log/$NAME.token
