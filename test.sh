#!/bin/bash

echo "Building..."
./build.sh -1

echo "\nBuilding completed\n"
cd tests
fift -s dice-test-suite.fif