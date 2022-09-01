#1/bin/bash
#Drop Database

path=pwd
read -p "What is the name of the database do you want to drop? " name

while true
do
	if [ -d $name ]
	then
		
		read -p "Are you sure you want to drop $name?(y/n) " ans
		while true
		do
			case $ans in
				[yY]) rm -r $name 
					break 2;;
				[nN]) source $path/Main_Menu.sh ;; #Return to main menu
				*) read -p "Please enter a suitable answer(y/n) " ans
					#return to the case again
			esac
		done
	else
		read -p "This database is not available, Please try again " name
	fi
done


