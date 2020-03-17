#!/bin/bash
# Usage: ./build.sh <workchain_id> [<file_base>] [<code_fif>]

if [ $# -lt 1 ]
then
echo "Usage: ${0} <workchain_id> [<file_base>] [<code_fif>]"
exit 0
fi

workchain_id=$1
file_base=$2
code_fif=$3

if [[ ! -d "./build" ]]
then
    mkdir build
fi

# Compile
func -SPA -o dice-compiled.fif ./stdlib.fc ./dice-code.fc

# Build
fift -s init.fif $workchain_id $file_base $code_fif

mv dice-compiled.fif *.boc ./build