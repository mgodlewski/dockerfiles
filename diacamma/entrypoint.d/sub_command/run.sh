#!/usr/bin/env bash

function wait_database {
    # Wait for DB to be ready before starting this
    if [ "${DIACAMMA_DATABASE}" != "" ]
    then
        sleep 10
    fi
}

function get_database_param {
    if [ "${DIACAMMA_DATABASE}" != "" ]
    then
        echo "-d ${DIACAMMA_DATABASE}"
    else
        echo ""
    fi
}

function get_module_list {
    case "${CURRENT_DIACAMMA_TYPE}" in
        asso)
            echo "lucterios.contacts,lucterios.documents,lucterios.mailing,diacamma.accounting,diacamma.payoff,diacamma.event,diacamma.member,diacamma.invoice"
            return 0
            ;;
        syndic)
            echo "lucterios.contacts,lucterios.documents,lucterios.mailing,diacamma.accounting,diacamma.payoff,diacamma.condominium"
            return 0
            ;;
        *)
            kill -s TERM ${TOP_PID}
            ;;
      esac
}

function init_database {
    if [ "${DIACAMMA_DATABASE}" != "" ]
    then
        pushd /var/lucterios2 > /dev/null
        /bin/bash launch_lucterios.sh refreshall
        popd > /dev/null
    fi
}

function run {
    echo Organisation: ${CURRENT_ORGANISATION}
    echo Type: ${CURRENT_DIACAMMA_TYPE}

    wait_database

    pushd /var/lucterios2 > /dev/null
    if [ ! -f ${CURRENT_ORGANISATION}/settings.py ]
    then
        modules=$(get_module_list)
        database_parameter=$(get_database_param)

        /bin/bash launch_lucterios.sh add -n ${CURRENT_ORGANISATION} -m "${modules}" -p diacamma.${CURRENT_DIACAMMA_TYPE} ${database_parameter}

        echo "LANGUAGE_CODE = 'fr'" >> ${CURRENT_ORGANISATION}/settings.py
        echo "ALLOWED_HOSTS = [ '*' ]" >> ${CURRENT_ORGANISATION}/settings.py
    fi

    source virtual_for_lucterios/bin/activate
    export DJANGO_SETTINGS_MODULE="${CURRENT_ORGANISATION}.settings"

    init_database

    exec gunicorn lucterios.framework.wsgi --bind=0.0.0.0:8100 --access-logfile - --error-logfile -
    popd > /dev/null
}

function usage {
    echo "Usage:"
    echo "      entrypoint.sh run"
    echo ""
    echo "  Run the Diacamma instance"
    echo ""
}
