#!/bin/bash
#Drop table
function drop { 

ls ./DBMS/
read -p "What is the name of the table do you want to drop? " tname
cd ./DBMS/$tname
while true
do
	if [ -f "$tname" ]

	then
		
		read -p "Are you sure you want to drop $5name?(y/n): " input
		while true
		do
			case $ans in
				[yY]) rm -r ./DBMS/$name 

					break 2;;
				[nN]) break 2 ;; #Return to main menu
				*) read -p "Please enter a suitable answer(y/n): " ans
					#return to the case again
			esac
		done
	else
		read -p "This database is not available, Please try again: " name
	fi
done
cd ..
echo Please press Enter to continue.
}



