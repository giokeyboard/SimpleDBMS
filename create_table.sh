#!/bin/bash
# Script to create a table inside the db directory

if [ $# -eq 3 ]; then   # check legal number of passed args
    if [ ! -d $1 ]; then # check if db already exists
        echo Error: DB does not exist
        exit 1
    else
        if [ -f "$1/$2" ]; then # db does not exist, check if table already exists
            echo Error: table already exists
            exit 1
        else
            ./p.sh $1 # P(S) when enter the CS
            echo $3 > "$1/$2"
            echo OK: table created
            ./v.sh $1 # V(S) when leave the CS
            exit 0
        fi
    fi
else
    echo Error: parameters problem
fi
