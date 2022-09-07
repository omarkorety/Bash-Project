#!/bin/bash

echo -e "enter nome of the table:"
read test
cols=$(awk -F: '{print NF}' $test | head -1)
colsnum=$(awk 'END{print NF}' test-meta)
echo $colsnum
for (( i = 2; i <= $colsnum; i++ )); do
    colName=$(awk -F: '{ if(NR=='$i') print $2}' test-meta)
    colType=$( awk  -F: '{if(NR=='$i') print $3}' test-meta)
    colKey=$( awk -F: '{if(NR=='$i') print $4}' test-meta)
	echo $colName
	echo $coltype
	echo $colkey
done
if [ ! -f ./$test ]
then
	echo "please enter name of the table right:" 
else
	echo "Number of colums is $cols "
	echo "PRIMARY KEY is $prim "
	for i in $(seq $cols)
	do
		echo "table colums are ="$(awk -F: '{print $0}' $test | head -1)
		field=$(awk -F: '{print $0}' $test | head -1 |cut -d: -f $i)

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

			
