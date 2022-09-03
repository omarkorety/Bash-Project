#!/bin/bash
. ./create.sh
. ./drop.sh
. ./connect.sh
select choice in "Create Database" "List Database" "Connect To Database" "Drop Database" "Exit"
do
case $REPLY in
1) create;;		#Create
2) ls -l ./DBMS/;;		#List
3) connect;;		#Connect
4) drop;;		#Drop
5) exit ;;
*) echo "Invalid entry"
esac
done
