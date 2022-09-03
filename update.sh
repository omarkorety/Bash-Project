#!/bin/bash
#UPDATE

function update {
	while true
	do
		read -p "Enter the table name: " name
		if [ -f "$name" ]
		then
			while true
			do
			read -p "Which column? " colu
			if [[ ! $colu =~ ^[0-9]+$ ]] ;then
				echo "Value must be an integer!"
			elif [[ $colu -gt `awk -F: '{print NF}' $name | head -1` ]]
			then
				echo "Too large number of columns!"
			else
				while true
				do
				read -p "Which row? " row
				if [[ ! $row =~ ^[0-9]+$ ]] ;then 
					echo "Value must be an integer!"
                       		elif [[ $row -gt `wc -l < $name` ]]
                       		then
					echo "Too large number of rows!"
				else
					read -p "Enter your update: " upd
					x=`awk -F: '{print $3}' "${name}-meta" | sed -n ${colu}p`
					echo $x
					if [[ $x = [iI] ]]
					then
						if [[ ! $upd =~ ^[0-9]+$ ]] ;then
							echo "Value must be an integer!"
						else
							
							y=`awk -F: -v k="$colu" '{print $k}' ${name} | sed -n ${row}p`
							awk -F: -v k="$colu": '{print $k}' ${name} | sed -i "${row}s/$y/$upd/" ${name}
						fi
					fi


				fi
				done
			fi
			done
		else
			echo "This table name doesn't exits"
			continue
		fi
	done



}
