#1/bin/bash
#Connect To Database

select choice in "Create Table" "List Tables" "Drop Table" "Insert Into Table" "Select From Table" "Delete From Table" "Update Table"	#Creating the menu
do
	case $REPLY in
		1);;			#Create
		2);;			#List
		3);;			#Drop
		4);;			#Insert
		5);;			#Select
		6);;			#Delete
		7);;			#Update
	esac
done
