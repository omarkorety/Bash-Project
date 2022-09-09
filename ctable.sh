#!/bin/bash
#I am ctable
function ctable {
	val=()
	meta=()
	typeset -i nos=0

	while true
	do
	read -p "Enter the table name: " name
	if [[ ! $name =~ ^[a-zA-Z]+$ ]] 
    then
        echo "Can't create a table with that name"
	elif [[ -f ./$name ]]
	then
		echo "Table name already exists."
	else
		break
 	fi
	done
	while true
	do
	read -p "How many columns do you want? " col
	if [[ ! $col =~ ^[0-9]+$ ]] ; then
   		echo "Value must be an integer!"
	else
		break
	fi
	done
	for i in $(seq $col)
	do
		while true
		do
			read -p "Name of column number $i " nm

			if [[ ! $nm =~ ^[a-zA-Z]+$ ]]
			then
				echo "Can't create a table with that name"
				continue
			fi
			if [[ $i -eq $col ]]
			then
			val+=${nm}
			else
			val+=${nm}:
			fi
			echo $val
			read -p "Integer or String? (i/s) " typ
			while true
			do
				if [[ ! $typ = [iIsS] ]]
				then
					read -p "Please enter either i or s " typ
				else

					break
				fi
			done
			if [[ $nos -eq 0 ]]
			then
				read -p "Primary key? (y/n) " ans
				while true
				do
					if [[ $ans != [yYnN] ]]
					then
						read -p "Please enter either y or n " ans
					elif [[ $ans = [yY] ]]
					then
						if [[ $i -eq $col ]]
						then
						meta+="$i:${nm}:$typ:primary"
						else
						meta+="$i:${nm}:$typ:primary\n"	
						fi
						nos+=1
						break
					else
						if [[ $i -eq $col ]] 
						then
							meta+="$i:${nm}:$typ"
						else
							meta+="$i:${nm}:$typ\n"
						fi
						break
					fi
				done
			else
				if [[ $i -eq $col ]]
				then
				meta+="$i:${nm}:$typ"
				else
				meta+="$i:${nm}:$typ\n"
				fi
			
			fi
			break
		done
	done
	echo $val >> $name
	echo -e $meta >> "${name}-meta"
	echo A table with the name $name is created successfully!
	echo Please press enter to continue..


}

