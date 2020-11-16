#!/bin/bash
# Script to insert tuples in a selected table

if [ $# -eq 3 ]; then # check number of args
    if [ -d $1 ]; then # check if db directory exists
        if [ -e "$1/$2" ]; then # check if table exists
            if [ $(head -n 1 "$1/$2" | grep -o "," | wc -l) -eq $(echo $3 | grep -o "," | wc -l) ]; then # check if the user is trying to enter a valid tuple
    	        ./p.sh $1 # P(S) when enter the CS
                echo $3 >> "$1/$2" # append tuples on the bottom of the table
                echo "OK: tuple inserted"
                ./v.sh $1 # V(S) when leave the CS
	            exit 0
            else
                echo "Error: number of columns in tuple does not match schema"
                exit 1
            fi
        else
            echo "Error: table does not exist"
        exit 1
        fi
    else
        echo "Error: DB does not exist"
        exit 1
    fi
else
    echo "Error: parameters problem"
    exit 1
fi
