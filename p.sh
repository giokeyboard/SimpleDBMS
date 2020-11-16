#!/bin/bash
# Script for the P(S) semaphore when a process enters the critical section (CS)

if [ -z $1 ]; then # check one arg is passed
    echo "Usage $0 mutex-name"
    exit 1
elif [ ! -e $1 ]; then # check that db directory (what we want to lock) exists
    echo "Target for the lock must exist"
    exit 2
else
    while ! mkdir "$1-lock" 2>/dev/null; do # try to create a lock for the db directory, if not possible wait and try again
        sleep 1
    done
    exit 0
fi
