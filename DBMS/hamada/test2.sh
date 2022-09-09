#!/bin/bash


read -p "enter table name " tname
if [ ! -f $tname ]
    then
		echo " dosen't exist"

fi

colnum=$(awk 'END{print NR}' test-meta)
arr=($(awk -F: '{ for(i = 1; i <= NF; i++) { if (NR==1) print $i; } }' $tname))					
for (( k = 1; k <$colnum ; k++ )); do
	coltyp=$(awk -F: -v i="$k" '{if(NR == i) print $3}' test-meta)
	colkey=$(awk -F: -v i="$k" '{if(NR == i) print $4}' test-meta) #to know if it primary or not
	while true
	do
	echo  "enter (${arr[k-1]}) is $coltyp" 
	read input
	if [[ $coltyp == "i" ]];then 
		while ! [[  $input =~ ^[0-9]*$ ]]; do
			echo "invalid DataType "
			echo -e "enter (${arr[k-1]}) "
 			read input
		done
	fi
	if [[ $colkey == "primary" ]]; then
		primcol=($(awk -F: -v i="$k" '{ if (NR > 1) print $i}' test))
		while [[ true ]];do
			if [[ $input =~ $primcol ]];then
				echo "primary cant repeated"
				continue 2
			else
				break 2;
			fi
			#echo -e "enter ${arr[k]}"
 			#read input

		done	
	fi
	done

done

