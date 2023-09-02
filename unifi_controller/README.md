# Docker: Unifi controller
## Description:
---
This repo contains a Dockerized version of Ubiqiti Network's Unifi Controller.

Image used from [jacobalerty](https://github.com/jacobalberty/unifi-docker).

## Deploy container:
---
```bash
docker-compose up -d
```

## Troubleshooting:
---
```bash
docker logs unifi01
docker exec -it unifi01 /bin/bash
```

## How to change upstream gateway in unifi access point:
---
```bash
ssh <IP of AP>
info
set-inform http://<IP of unifi controller>:8080/inform
```

## Author:
---
Created in 2022 by Florian Hild for private use.
