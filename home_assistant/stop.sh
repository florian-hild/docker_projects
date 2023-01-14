#!/bin/bash

#-------------------------------------------------------------------------------
# Author     : Florian Hild
# Created    : 21-12-2022
# Description:
#-------------------------------------------------------------------------------

export LANG=C
declare -r __SCRIPT_VERSION__='1.0'

docker-compose -f ${1:-"docker-compose.yml"} stop

