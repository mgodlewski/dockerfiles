#!/usr/bin/env bash

function run {
    pushd /var/lucterios2 > /dev/null
    now=$(date "+%Y%m%d_%H_%M_%S")
    /bin/bash launch_lucterios.sh archive --name=${CURRENT_ORGANISATION} --file=/backups/backup_${now}.lbkf
    popd > /dev/null
}
