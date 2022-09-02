#1/bin/bash
#Connect To Database
function connect {
. ./ctable.sh
read -p "Enter the database name you want to connect to " name

while true
do


	if [ -d ./DBMS/$name ]
	then
		cd ./DBMS/$name
		select choice in "Create Table" "List Tables" "Drop Table" "Insert Into Table" "Select From Table" "Delete From Table" "Update Table"	#Creating the menu
		do
			case $REPLY in
				1) ctable;;			#Create
				2) ls -I "*-meta";;			#List
				3);;			#Drop
				4);;			#Insert
				5);;			#Select
				6);;			#Delete
				7);;			#Update
			esac
			break 2
		done
	else
		read -p "This database is not available, please try again: " name
	fi
done
}
