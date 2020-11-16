#!/bin/bash
# Script for the server to get requests from clients and run them in the background

mkfifo server.pipe # create the server pipe

trap server_shut INT # call exit function when press CTRL+c

# function to trap the I/O interrupt allowing clean exit
function server_shut()
{
echo "...About to exit: Ctrl_c trapped"
rm server.pipe
exit 0
}

id=$1
while true; do
    read id req db table row < server.pipe # read input from server pipe
    case $req in
        create_database)
            ./create_database.sh $db $table $row > "$id.pipe" & # send output to client pipe
            ;;
        create_table)
            ./create_table.sh $db $table $row > "$id.pipe" &
            ;;
        insert)
            ./insert.sh $db $table $row > "$id.pipe" &
            ;;
        query)
            ./query.sh $db $table $row > "$id.pipe" &
            ;;
        shutdown)
            rm server.pipe
            exit 0
            ;;
        *)
            echo "Error : bad request"
            exit 1
    esac
done
