#!/bin/bash
# Script to create the database abstraction (directory on the file system)

if [ $# -eq 1 ]; then # check if only one arg is passed
    if [ -d $1 ]; then # check if directory already exists
        echo "Error: DB already exists"
        exit 1
    else
        mkdir $1
        echo "OK: database created"
        exit 0
    fi
elif [ $# -eq 0 ]; then # illegal to pass no arg
    echo "Error: no parameter"
    exit 1
else # illegal to pass multiple args
    echo "Error: parameter problem"
    exit 1
fi
