#!/bin/bash

echo "Building..."
./build.sh -1

echo "\nBuilding completed\n"
cd tests

for x in `ls -1 *-test.fif`
do
    echo $x
    fift -s test-runner.fif $x
done