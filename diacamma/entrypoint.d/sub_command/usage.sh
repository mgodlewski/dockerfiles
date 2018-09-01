#!/usr/bin/env bash

function run {
    COMMAND="${1}"
    if [ "${COMMAND}" != "" ]; then
        if [ ! -f sub_command/${COMMAND}.sh ]; then
            display_error "Undefined command \"${COMMAND}\". See usage below:"
            echo ""
        else
            source "sub_command/${COMMAND}.sh"
            # shift off first parameter to cascade remaining to sub command
            shift 1
            usage $@
            return 0
        fi
    fi

    usage
}

function usage {
    echo "Usage:"
    echo "      entrypoint.sh [<command_name>]"
    echo ""
    echo "Available commands:"
    echo ""
    echo "  Action:"
    echo "      run                         Run Diacamma instance"
    echo ""
    echo "  Admin:"
    echo "      backup                      Backup Diacamma instance to a backup file"
    echo "      restore <file-to-restore>   Restore Diacamma instance from the provided backup file"
    echo ""
    echo "  Help:"
    echo "      version                     Show the Diacamma version running"
    echo "      usage                       This help screen"
    echo "      usage <command_name>        Help for the given command"
    echo ""
}
