#!/bin/bash
. ./create.sh
. ./drop.sh
select choice in " Create Database\n" "List Database\n" "Connect To Database\n" "Drop Database\n" "Exit"
do
case $REPLY in
1) create;;		#Create
2);;		#List
3);;		#Connect
4) drop;;		#Drop
5) exit ;;
*) echo "Invalid entry"
esac
done
