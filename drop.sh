#1/bin/bash
#Drop Database

path=pwd
echo -p "What is the name of the database do you want to drop? " name

while true
do
	if [ -d $name ]
	then
		
		echo -p "Are you sure you want to drop $name?(y/n) " ans
		while true
		do
			case $ans in
				[yY]) rm -r $name 
					break 2;;
				[nN]) source $path/Main_Menu.sh ;; #Return to main menu
				*) echo -p "Please enter a suitable answer(y/n) " ans
					#return to the case again
			esac
		done
	else
		echo -p "This database is not available, Please try again " name
	fi
done


