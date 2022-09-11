#!/bin/bash
. ./create.sh
. ./drop.sh
source connect.sh
function main_menu {
echo "                       ___________________                          " 
echo "--------------------|||WELCOME TO OUR DBMS|||-----------------------"
echo "                                                 " 

echo -e "----------------|||Please select your choice!|||---------------\n"
select choice in "Create Database" "List Database" "Connect To Database" "Drop Database" "Exit"
	do
	case $REPLY in
		1) create ;;						#Create
		2) ls  ./DBMS/ ;echo  "-------------------------------------------------------------" ;main_menu;;   #List
		3) connect;;						#Connect
		4) drop;;						#Drop
		5) exit ;;
		*) echo "Invalid entry"
esac
done
}
main_menu
