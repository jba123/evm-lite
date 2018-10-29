#!/bin/bash

set -eu

IPS=${1:-"ips.dat"}
KEY_DIR=${2:-"../deploy/conf/babble/conf/keystore"}
PWD_FILE=${3:-"../deploy/conf/eth/pwd.txt"}
PORT=${4:-8080}
SOL_FILE=${5:-"crowd-funding.sol"}

ips=($(cat ${IPS} | awk '{ print $2 }' | paste -sd "," -))

node nodejs/demo.js --ips=$ips \
    --port=$PORT \
    --contract=$SOL_FILE \
    --keystore=$KEY_DIR \
    --pwd=$PWD_FILE


