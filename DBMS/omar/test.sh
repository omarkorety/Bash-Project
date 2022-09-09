#!/bin/bash
echo -e "enter nome of the table:"
read test

if [ ! -f ./$test ]
then
	echo "please enter name of the table right:"
	read test
fi
cols=$(awk -F: '{print NF}' $test | head -1)
colsnum=$(cat test-meta | wc -l)




for (( k=1; k<=$colsnum; k++ )); do
    colname= $(awk -F: '{if(NR -eq $k) print $2}' test-meta) #to get current column name
    coltype= $(awk -F: '{if(NR -eq $k) print $3}' test-meta) #to get current column type
    colkey= $(awk -F: '{if(NR -eq $k) print $4}' test-meta) #to know if it primary or not
	read -p "Tabel $colname is $coltype" data 
	
	if [[ $coltype == "i" ]] ;then 
	while ! [[ $data =~ ^[0-9]*$ ]]; do
        	echo "invalid DataType "
        	echo "Tabel $colname is $coltype"
        	read $data
      	done
	fi
		echo "table colums are ="$(awk -F: '{print $0}' $test | head -1)
	read -p "enter colom $field" input
done
