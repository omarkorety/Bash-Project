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
                       		elif [[ $row+1 -gt `wc -l < $name` ]]
                       		then
					echo "Too large number of rows!"
				else
					((row+=1))
					read -p "Enter your update: " upd
					x=`awk -F: '{print $3}' "${name}-meta" | sed -n ${colu}p`
					echo $x
					if [[ $x = [iI] ]]
					then
						if [[ ! $upd =~ ^[0-9]+$ ]] ;then
							echo "Value must be an integer!"
						else
							
							y=`awk -F: -v k="$colu" '{print $k}' ${name} | sed -n ${row}p`
						echo | awk -F: -v colu="$colu" -v row="$row" -v y="$y" -v upd="$upd" -v name="$name" '{if ($colu==y && NR==row) $colu=upd ; gsub (" ", ":", $0); print > name }' $name

							#cat $name
							#rm -f $akhirannarihka
							#awk -F: -v k="$colu": '{print $k}' ${name} | sed -i "${row}s/$y/$upd/" ${name}
					 
							break 3
						fi
					else
						if [[ ! $upd =~ ^[a-zA-Z]+$ ]] ;then
							echo Value must be a string!
						else
							 y=`awk -F: -v k="$colu" '{print $k}' ${name} | sed -n ${row}p`
                                                echo | awk -F: -v colu="$colu" -v row="$row" -v y="$y" -v upd="$upd" -v name="$name" '{if ($colu==y && NR==row) $colu=upd ; gsub (" ", ":", $0); print > name }' $name
						break 3
						fi
					fi


				fi
				done
			fi
			done
		else
			echo "This table name doesn't exist!"
			continue
		fi
	done
echo Please press Enter to continue..
#cat $akhiran
#rm $akhirannarihka

}
