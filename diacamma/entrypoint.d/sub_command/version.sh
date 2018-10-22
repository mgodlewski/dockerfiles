#!/usr/bin/env bash

function run {
    pushd /var/lucterios2 > /dev/null
    /bin/bash launch_lucterios.sh check | grep '=>' | cut -f2 | sort | tail -1
    popd > /dev/null
}
