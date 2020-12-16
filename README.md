# SimpleDBMS
Implementation of a rudimentary DBMS where server and clients interact with a central database

There are 8 shell scripts.
In order to test and run the DBMS, it’s highly suggested to open two terminal windows, and run *server.sh* in one and *client.sh* in another.
The following is to be taken as a suggested procedure to run the whole system:

Step 1) run *server.sh*: the server script will enter an infinite loop to keep it running, waiting for user requests and executing all the legal ones in the background.

Step 2) run *client.sh* followed by a client id number in a separate terminal tab/window to enter commands. The scripts enter then an infinite loop to continuously accept legal requests from the user.

Available commands to be run at client-side:

- **create_database** requires an argument as db folder name to be created

- **create_table**: requires 3 arguments —> db directory valid name, table valid name and column names to be generated (comma-separated). E.g.: `database1 table1 col1,col2,col3`

- **insert** requires 3 arguments —> db directory valid name, table valid name, tuple values to insert in existing columns. E.g.: `database1 table1 value1,value2.value3`

- **query** if user enters 2 arguments it prints the corresponding table as a whole. If user inputs 3 arguments (db name, table name, column numbers to display) it displays the corresponding columns by numbers including headers. E.g.:  `database1 table1 2,3`
