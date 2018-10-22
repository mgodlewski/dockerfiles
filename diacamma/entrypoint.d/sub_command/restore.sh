#!/usr/bin/env bash

function run {
    pushd /var/lucterios2 > /dev/null
    filename="/backups/${1}"
    if [ -f ${filename} ]
    then
        /bin/bash launch_lucterios.sh restore --name=${CURRENT_ORGANISATION} --file=${filename}
    else
        echo "File ${filename} not found : cannot restore instance ${CURRENT_ORGANISATION}"
    fi
    popd > /dev/null
}
