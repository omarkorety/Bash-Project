#!/bin/bash
function selct {
declare -a arr
read -p "whitch table u want to select from" tname
cols=$(awk -F: '{print NF}' $tname | head -1)
for ((i=1;i<=cols;i++))
do
arr+=($(awk -F: '{print $0}' $tname |head -1 |cut -d: -f$i))
done
len_array=${#arr[@]}
select choice in "all" "row" "columns"
do
if [ "$choice" == "all" ]
then 

column -t  $tname
if [[ $? != 0 ]]
then
echo "Error Displaying Table $tname"
fi
fi
if [ "$choice" == "row" ]
then
echo "enter the primary key:"
read prim
grep -i -w $prim $tname
fi
#if [ "$choice" == "columns" ]
#then
#read -p "enter the column u want :" column
#for ((i=1;i<=$len_array;i++))
#do
#if [ arr[i] == "column" ]
#then 
#	 echo $(awk 'BEGIN{FS=":"}{print $1}' $tname)

#fi
#done
#fi
done

}





#i want to create array from file



