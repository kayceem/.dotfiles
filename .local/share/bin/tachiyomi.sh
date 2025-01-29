#!/bin/env sh
systemctl start docker
docker-compose -f /home/kayc/Docker/Tachidesk/docker-compose.yaml up -d
xdg-open http://localhost:4567/
