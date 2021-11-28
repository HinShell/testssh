#!/bin/bash
# comment
self=`basename "$0"`
#echo $self
#a=$(git diff origin/main --quiet $self)
#echo $?
function mytest {
    $($@)
    local status=$?
    if (( status != 0 )); then
        echo "error with $1" >&2
    fi
    return $status
}
mytest "git diff origin/main --quiet $self"
