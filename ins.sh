#!/bin/bash
function insert {
read -p "enter table name " tname
if [ ! -f $tname ]
    then
		echo " dosen't exist"
		insert
fi
colnum=$(awk 'END{print NR}' "${tname}-meta")
#arr=($(awk -F: '{ for(i = 1; i <= NF; i++) { if (NR==1) print $i; } }' $tname))					
for (( k = 1; k <=$colnum ; k++ )); do
	coltyp=$(awk -F: -v i="$k" '{if(NR==i) print $3}' "${tname}-meta")
	colkey=$(awk -F: -v i="$k" '{if(NR==i) print $4}' "${tname}-meta") #to know if it primary or not
	colname=$(awk -F: -v i="$k" '{if(NR==i) print $2}' "${tname}-meta")
	#while true ;do
	echo  "enter ($colname)) is $coltyp" 
	read input
	if [[ $coltyp == "i" ]];then 
		while ! [[  $input =~ ^[0-9]*$ ]]; do
			echo "invalid DataType "
			echo -e "enter ($colname) "
 			read input
		done
	fi
	if [[ $colkey == "primary" ]]; then
		primcol=($(awk -F: -v i="$k" '{ if (NR > 1) print $i}' $tname))
		#while [[ true ]];do			
			for item in "${primcol[@]}" ; do
				if [[ $input == "$item" ]];then
					echo "this primary key found"
				else
					break ;
				fi
				echo -e "enter ($colname)"
			 	read input

			done
		#done
	fi
#	echo -e "enter ($colname) "
# 	read input
	#done

	if [[ $k -eq $colnum ]]
	then
			row+=${input}
	else
			row+=${input}:
	fi

done
		echo $row

echo $row >> $tname
			
}

			
