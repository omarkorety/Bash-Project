#!/bin/bash
#DELETE FROM TABLE

function deltable {
	while true
        do
                read -p "Enter the table name you want to delete from: " name
                if [ -f "$name" ]
                then
			while true
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
					break 2
			fi
			done
		else
			echo "This table is not available, please try again: "
		fi
	done

echo Please press Enter to continue..
			
}
