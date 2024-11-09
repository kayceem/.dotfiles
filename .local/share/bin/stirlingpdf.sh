#!/bin/env sh
sudo systemctl start docker
docker-compose -f /home/kayc/Docker/Stirling-PDF/docker-compose.yaml up -d
xdg-open http://localhost:7007/
