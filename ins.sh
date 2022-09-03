#!/bin/bash
. ./ctable.sh
function insert {
echo -e "enter nome of the table:"
read tname
cols=$(awk -F: '{print NF}' $tname | head -1)
if [ ! -f ./$tname ]
then
	echo "please enter name of the table right:" 
else
	echo "Number of colums is $cols "
	echo "PRIMARY KEY MUST BE UNIQUE"
	for i in $(seq $cols)
	do
		echo "table colums are ="$(awk -F: '{print $0}' $tname | head -1)
		field=$(awk -F: '{print $0}' $tname | head -1 |cut -d: -f $i)

		read -p "enter colom $field" input
		if [[ $i -eq $cols ]]
		then
			row+=${input}
		else
			row+=${input}:
		fi
		echo $row
	done

fi
echo $row >> $tname
}

			
