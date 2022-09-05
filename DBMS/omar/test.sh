#!/bin/bash
declare -a arr
cols=$(awk -F: '{print NF}' test | head -1)
for ((i=1;i<=cols;i++))
do
arr+=($(awk -F: '{print $0}' test |head -1 |cut -d: -f$i))
done
len_array=${#arr[@]}
select choice in "all" "spicefic coulm"
do
if [ "$choice" == "all" ]
then 
cat test
elif [ "$choice" == "spicefic coulm" ]
then
echo "Those couloms that can display in this table"
awk -F: '{print $0}' test |head -1
read -p "enter the coulmn u need: " col
for i in "${arr[@]}"
do
   	if [ "$i" == "$col" ] ; then
 		echo "Found"
		if
    	fi
done
fi
done

#echo ${arr[2]}
