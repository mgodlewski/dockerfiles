#!/usr/bin/env bash
set -e

trap "exit 1" TERM
export TOP_PID=$$

export CURRENT_ORGANISATION=${DIACAMMA_ORGANISATION:-asso}
export CURRENT_DIACAMMA_TYPE=${DIACAMMA_TYPE:-asso}

export BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "${BIN_DIR}/common.sh"
pushd ${BIN_DIR} > /dev/null

COMMAND="$1"
if [ "${COMMAND}" == "" ]; then
    COMMAND="usage"
else
    # shift off first parameter to cascade remaining to sub command
    shift 1
fi

if [ ! -f sub_command/${COMMAND}.sh ]; then
    echo "Undefined command \"${COMMAND}\". See usage below:"
    echo ""
    COMMAND="usage"
fi
source "sub_command/${COMMAND}.sh"

run $@
RETURN_CODE=$?
popd > /dev/null
exit ${RETURN_CODE}
