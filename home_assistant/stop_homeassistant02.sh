#!/bin/bash

#-------------------------------------------------------------------------------
# Author     : Florian Hild
# Created    : 21-12-2022
# Description:
#-------------------------------------------------------------------------------

export LANG=C
declare -r __SCRIPT_VERSION__='1.0'
declare -r docker_compose_file='docker-compose_homeassistant01.yml'

docker-compose -f ${docker_compose_file} stop

