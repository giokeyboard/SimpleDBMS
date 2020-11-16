#!/bin/bash
# Script for the client sending requests to the server

if [ $# -eq 1 ]; then # check parameter validity
    id=$1
    mkfifo $id.pipe # create individual client pipe
    
    trap client_shut INT # call exit function when press CTRL+c
    
    # function to trap I/O interrupt allowing clean exit
    function client_shut() {
        echo "...About to exit: Ctrl_c trapped"
        rm $id.pipe
        exit 0
    }
    
    while true; do
        echo "Available commands: create_database, create_table, insert, query, shutdown"
        echo "Please enter your request: "
        read req db table row # prompt user for a command
        case $req in
            create_database)
                echo $id $req $db $table $row > server.pipe # write user request on the server pipe
                read message < $id.pipe # read output on client pipe
                echo $message # display output
                ;;
            create_table)
                echo $id $req $db $table $row > server.pipe
                read message < $id.pipe
                echo $message
                ;;
            insert)
                echo $id $req $db $table $row > server.pipe
                read message < $id.pipe
                echo $message
                ;;
            query)
                echo $id $req $db $table $row > server.pipe
                read message < $id.pipe
                if [[ $message == *"Error"* ]]; then
                    echo $message
                else
                    echo "Start result"
                    echo $message | sed 's/ /\n/g' # decode message to display table rows on new lines
                    echo "End result"
                fi
            ;;
            shutdown)
                rm $id.pipe
                exit 0
            ;;
            *)
                echo "Error: bad request"
                rm $id.pipe
                exit 1
        esac
    done
    rm $id.pipe
else
    echo "Error: bad client id"
fi
