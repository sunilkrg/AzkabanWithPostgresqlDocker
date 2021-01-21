#!/bin/bash
/usr/sbin/sshd

cd /app/azkaban_service/azkaban/azkaban-exec
./bin/start-exec.sh
cd /app/azkaban_service/azkaban/azkaban-web
./bin/start-web.sh

cd /app/azkaban_service
nohup ./healthcheck.sh &

tail -f /dev/null
