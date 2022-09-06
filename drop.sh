#!/bin/bash
#Drop Database
function drop { 

path= pwd
read -p "What is the name of the database do you want to drop? " name

while true
do
	if [ -d ./DBMS/$name ]

	then
		
		read -p "Are you sure you want to drop $name?(y/n) " ans
		while true
		do
			case $ans in
				[yY]) rm -r ./DBMS/$name 

					break 2;;
				[nN]) break 2 ;; #Return to main menu
				*) read -p "Please enter a suitable answer(y/n) " ans
					#return to the case again
			esac
		done
	else
		read -p "This database is not available, Please try again " name
	fi
done

echo Please press Enter to continue.
}



