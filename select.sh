#!/bin/bash
function selct {
#declare -a arr

select choice in "selet all" "select by colum" "select by row"
do
case $REPLY in
1)showall;;			
2) ;;
3)byrow;;		
*) echo "Invalid entry"
esac
done
}
function showall {
    read -p "whitch table u want to select from" tname

    column -t -s ';' $tname
}
function  byrow {
    read -p "whitch table u want to select from" tname
        num_of_rows=$(awk -F: 'END{print NR}' $tname)
        if [  -f $tname ];then
            field=$(awk -F":" '{print $0}' $tname|cut -d: -f1 |head -1)

            echo "please Enter $field to print"
            read input
            if ! [[ $input =~ ^[0-9]+$ ]]; then
                echo "please Enter $field to print" 
            else
                grep -i -w $input $tname
            fi
            
        else
            echo " dosen't exist"
		    byrow
        fi
	
}

    
#cols=$(awk -F: '{print NF}' $tname | head -1)
#for ((i=1;i<=cols;i++))
#do
#arr+=($(awk -F: '{print $0}' $tname |head -1 |cut -d: -f$i))
#done
#len_array=${#arr[@]}
#elect choice in "all" "row" "columns"
#do
#if [ "$choice" == "all" ]
#then 
#column -t  $tname
#if [[ $? != 0 ]]
#then
#echo "Error Displaying Table $tname"
#fi
#fi
#if [ "$choice" == "row" ]
#then
#echo "enter the primary key:"
#read prim
#grep -i -w $prim $tname
#fi
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
#done





#i want to create array from file



