#1/bin/bash
#I am ctable
function ctable {
	val=()
	meta=()

	while true
	do
	read -p "Enter the table name: " name
	if [[ $name =~ [\&@!#$%^/.:\|\-] ]] || [[ $name = "" ]]
                        then
                                echo "Can't create a table with that name"
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

			if [[ $nm =~ [\&@!#$%^/.:\|\-] ]] || [[ $nm = "" ]]
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
			read -p "Primary key? (y/n) " ans
			while true
			do
				if [[ $ans != [yYnN] ]]
				then
					read -p "Please enter either y or n " ans
				elif [[ $ans = [yY] ]]
				then
					meta+="$i:${nm}:$typ:primary\n"
					break
				else
					meta+="$i:${nm}:$typ\n"
					break
				fi
				
			done
			break
		done
	done
	echo $val >> $name
	echo -e $meta >> "${name}-meta"
	echo A table with the name $name is created successfully!


}

