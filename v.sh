#!/bin/bash
# Script for the V(S) semaphore when a process leaves the critical section (CS)

if [ -z $1 ]; then # check one arg is passed
    echo "Usage $1 mutex-name"
    exit 1
else
    rmdir "$1-lock" # remove the lock to the db directory
    exit 0
fi
