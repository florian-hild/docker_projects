FROM jacobalberty/unifi

ARG container_uid
ARG container_gid

RUN usermod -u $container_uid unifi && groupmod -g $container_gid unifi
