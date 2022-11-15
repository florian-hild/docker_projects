# Docker: Unifi controller
## Description:
---
This repo contains a Dockerized version of Ubiqiti Network's Unifi Controller.

Image used from [jacobalerty](https://github.com/jacobalberty/unifi-docker).

Changed UID and GID, so you can use the same as in the docker host system.

## Preparation:
---
Folder structure:
```bash
unifi
  ├── data
  └── log
```

```bash
mkdir -p unifi/{data,log}
```

docker-compose variables are stored in the .env file located in the same directorie.
```bash
vim .env
# env file for unifi_controller docker-compose
container_name=unifi01
uid=1000
gid=1000
base_dir=/usr/local/share/unifi
macvlan_name=unifi01
interface=ens18
ipv4_address=10.0.0.30
ipv4_network=10.0.0.0/24
ipv4_gateway=10.0.0.1
```

## Deploy container:
---
```bash
docker-compose up -d --build
```

## Troubleshooting:
---
```bash
docker logs unifi01
docker exec -it unifi01 /bin/bash
```

## How to change upstream gateway in unifi access point
---
```bash
ssh <IP of AP>
info
set-inform http://<IP of unifi controller>:8080/inform
```

## Author:
---
Created in 2022 by Florian Hild for private use.
