#!/bin/bash

echo "Building..."
./build.sh -1

echo "\nBuilding completed\n"
cd tests
fift -s test-runner.fif *-test.fif
