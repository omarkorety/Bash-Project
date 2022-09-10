#!/bin/bash
function insert {
	. ../../connect.sh

row=()
echo "Avaliable Tables"
echo `ls -I "*-meta"`
read -p "Enter the table name: " tname
if [ ! -f $tname ]
    then
		echo "The table $tname doesn't exist"
		insert
fi
colnum=$(awk 'END{print NR}' "${tname}-meta")
#arr=($(awk -F: '{ for(i = 1; i <= NF; i++) { if (NR==1) print $i; } }' $tname))					
for (( k = 1; k <=$colnum ; k++ )); do
	coltyp=`awk -F: -v i="$k" '{if(NR==i) print $3}' "${tname}-meta"`
	colkey=`awk -F: -v i="$k" '{if(NR==i) print $4}' "${tname}-meta"` #to know if it primary or not
	colname=`awk -F: -v i="$k" '{if(NR==i) print $2}' "${tname}-meta"`
	while true ;do
	echo  "Enter in ($colname) a/an $coltyp value:" 
	read input
	if [[ $input == "" ]];then
		echo "Really?"
		continue
	fi
	if [[ $coltyp == [iI] ]];then 
		while ! [[  $input =~ ^[0-9]*$ ]]; do
<<<<<<< HEAD:ins2.sh
			echo "Invalid DataType "
			echo -e "Please enter an integer ($colname) "
 			read input
		done
	elif [[ $coltyp == "s" ]];then
		while ! [[ $input =~ ^[0-9]*$ ]]; do
			echo "Invalid DataType"
			echo -e "Please enter a string ($colname) "
=======
			echo "invalid DataType "
			echo -e "Enter ($colname) which is an integer "
 			read input
		done
	
	else 
		while ! [[ $input =~ ^[a-zA-Z]+$ ]]; do
			echo "Invalid DataType "
			echo -e "Enter ($colname) which is a string"
			read input
		done
	fi
	if [[ $colkey == "primary" ]]; then
		primcol=($(awk -F: -v i="$k" '{ if (NR > 1) print $i}' $tname))
		#while [[ true ]];do			
			for item in "${primcol[@]}" ; do
				if [[ $input == "$item" ]];then
					echo "This value already exists"
					continue 2
				fi
				##echo -e "enter ($colname)"
			 	##read input

<<<<<<< HEAD:ins2.sh
		#	done
=======
			done
			break
		#done
		
	fi
	break
	done
#	echo -e "enter ($colname) "
# 	read input
	#done

	if [[ $k -eq $colnum ]]
	then
			row+=""${input}""
	else
			row+=${input}:
	fi

done
		echo $row

echo -e $row >> "$tname"

read -p "Do you to insert more?(y/n) " ans
while true
do
		if [[ $ans != [yYnN] ]]                     
	       	then
                read -p "Please enter either y or n " ans
                elif [[ $ans = [yY] ]]
                then
			insert
		else
			cd ../..
			connect
		fi
done
			
}

			
