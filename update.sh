#!/bin/bash

function _init {
    eval "git fetch"
    self=$(basename "${0}")
    selfcheck="git diff origin/main --quiet ${self}"
} 

function selftest {
    local msg="${2}"
    local app="${1}"
    eval "${app}"
    local status=${?}
    if (( status != 0 )); then
        echo "${msg}" >&2
    fi
    return ${status}
}

function autoCheckout {
    local checkout="${1}"
    local cmd="git checkout ${checkout} --quiet"
    selftest "${cmd}" "error with ${cmd}" || exit 1
    exec "./${self}"
    exit 0
}

_init
selftest "${selfcheck}" "script auto update." || autoCheckout "${self}"
echo "OK"
