#!/bin/bash
#DELETE FROM TABLE

function deltable {
	while true
        do
                read -p "Enter the table name you want to delete from: " name 	#
                if [ -f "$name" ]
                then
				select choice in "Delete all" "Delete a row"
				do
				case $REPLY in
				1) read -p "Are you sure you want to delete all? (y/n) " ans
					while true
					do
					case $ans in
					[yY]) awk -v name="$name" '{ if (NR==1) print > name; exit }' $name

						break 3;;
					[nN]) break 3 ;; #Return to main menu
					*) read -p "Please enter a suitable answer(y/n): " ans
						#return to the case again
					esac
					done;;

				2) while true
				do
				read -p "Enter the row number you want to delete: " row
				if [[ ! $row =~ ^[0-9]+$ ]] ;then
                    echo "Value must be an integer!"
            	elif [[ $row+1 -gt `wc -l < $name` ]]
                then
                    echo "Too large number of rows!"
                else
					((row+=1))
					awk -F: -v row="$row" -v name="$name" '{ if (NR != row) print > name }' $name
					break 3
				fi
				done;;
				*) echo "Enter 1 or 2"; continue;;
				esac
				done
				else
					echo "This table is not available, please try again: "
				fi

		done

echo "Backing To Main Menu"
main_menu
			
}
