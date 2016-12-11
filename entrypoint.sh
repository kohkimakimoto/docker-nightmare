#!/bin/bash
set -e

# Some command(s) has been passed to container? Execute them and exit.
export NODE_PATH=`npm root -g 2> /dev/null`
if [ -z "$cmd" ]; then
    if [[ ! $@ ]]; then
        echo "error: please pass a file to run." 1>&2
        exit 1
    fi
    cmd='xvfb-run --server-args "-screen 0 1024x768x24" node --harmony'
fi

eval "${cmd} $@"
