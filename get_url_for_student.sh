#!/bin/bash
source $1

echo "
location /$NAME/ {
    proxy_pass http://vm4:$PORT;
    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    proxy_set_header X-Real-IP \$remote_addr;
    proxy_set_header Host \$http_host;
    proxy_http_version 1.1;
    proxy_redirect off;
    proxy_buffering off;
    proxy_set_header Upgrade \$http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_read_timeout 86400;
}"

