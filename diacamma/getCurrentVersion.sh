#!/bin/bash

/var/lucterios2/launch_lucterios.sh check |grep '=>' | cut -f2 | sort | tail -1

