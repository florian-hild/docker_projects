#!/bin/bash

#-------------------------------------------------------------------------------
# Author     : Florian Hild
# Created    : 21-12-2022
# Description:
#-------------------------------------------------------------------------------

export LANG=C
declare -r __SCRIPT_VERSION__='3.0'

readarray -t containers < <(/bin/grep -w "^\s*container_name:" ${1:-"docker-compose.yml"} |awk '{print $2}')
declare -i i=0
for container in "${containers[@]}"; do
  containers[${i}]="${container};$(docker inspect --format '{{ index .Config.Labels "org.opencontainers.image.version"}}' ${container})"
  i=${i}+1
done

echo "Pull and build images:"
echo "================================================================="
docker-compose -f ${1:-"docker-compose.yml"} pull
docker-compose -f ${1:-"docker-compose.yml"} build --no-cache

echo "Create containers:"
echo "================================================================="
docker-compose -f ${1:-"docker-compose.yml"} up \
  --force-recreate \
  --detach \
  --remove-orphans

echo "Docker cleanup:"
echo "================================================================="
docker system prune -f

echo
printf "+---------------------------------------------------------------+\n"
printf "| %-15s | %-20s | %-20s |\n" "Contailer" "Old version" "New version"
printf "+---------------------------------------------------------------+\n"
for container in "${containers[@]}"; do
  new_version="$(docker inspect --format '{{ index .Config.Labels "org.opencontainers.image.version"}}' ${container%%;*})"
  history_log="$(dirname "$(realpath -s "${1:-"docker-compose.yml"}")")/update_history_${container%%;*}.log"

  printf "| %-15s | %-20s | %-20s |\n" "${container%%;*}" "${container#*;}" "${new_version}"

  # Write update historie log
  if [[ "$(tail -1 ${history_log}|awk '{print $2}')" != "${new_version}"  ]]; then
    echo "$(date +%F_%H-%M-%S): ${new_version}" >> ${history_log}
  fi
done
printf "+---------------------------------------------------------------+\n"

