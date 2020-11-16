#!/bin/bash
# Script to query and show selected table columns

if [ $# -le 3 ]; then # check number of args
    if [ -d $1 ]; then # check if db exists
        if [ -e "$1/$2" ]; then # check if table exists
            if [ $# -eq 2 ]; then
                # print whole table when only db and table name supplied
                ./p.sh $1 # P(S) semaphore when enter the CS
                cat $1/$2 | tr '\n' ' '
                ./v.sh $1 # V(S) semaphore when leave the CS
            elif [ $# -eq 3 ]; then
                # for loop to check if entered columns exist in the table
                column=$(echo $3 | tr "," " ")
                count=0
                for col in $column; do
                    if [ $col -eq 0 ] || [ $(cut -d "," -f $col "$1/$2" | wc -w) -eq 0 ]; then
                        (( count++ ))
                    fi
                done
                if [ $count -eq 0 ]; then # column numbers entered by the user are valid, proceed
                    ./p.sh $1 # P(S) semaphore when enter the CS
                    cut -d "," -f$3 "$1/$2" | tail -n +1 | tr '\n' ' '
	                ./v.sh $1 # V(S) semaphore when leave the CS
                    exit 0
                else
                    echo "Error: column does not exist"
                    exit 1
                fi
            else
                echo "Error: parameters problem"
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

