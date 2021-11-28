#!/bin/bash

self=$(basename "${0}")
selfcheck="git diff origin/main --quiet ${self}"

function selftest {
    local msg="${2}"
    $(${1})
    local status=${?}
    if (( status != 0 )); then
        echo "${msg}" >&2
    fi
    return ${status}
}

selftest "${selfcheck}" "script auto update." && echo OK || echo KO
