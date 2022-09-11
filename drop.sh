#!/bin/bash
#Drop Database
function drop { 

#path= pwd
ls ./DBMS/

read -p "What is the name of the database do you want to drop? " name
cd ./DBMS

while true
do
	if [ -d "$name" ]

	then
		
		read -p "Are you sure you want to drop $name?(y/n): " ans
		while true
		do
			case $ans in
				[yY]) rm -r ./$name 

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
echo -e "\n--------------------Successfully Deleted------------------------"
main_menu
}



