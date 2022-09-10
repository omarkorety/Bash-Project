#!/bin/bash
echo "Avaliable Tables"
echo `ls -I "*-meta"`
read -p "Which Table You Want To Select From :" tname
if [[ $tname == "" ]];then
		echo "Really?"
		
fi

if [ ! -f $tname ];then
	echo "no table like that"
    bycols
fi
echo "Avaliable Columns"
echo `awk -F: '{print $0}' $tname | head -1`
colnum_num=$(awk 'END{print NR}' "${tname}-meta")
while  true ;do
	read -p  "Please Enter the Coulmn You Want:" input
	if  ! [[  $input =~ ^[0-9]*$ ]]; then
		echo "ple "
		echo -e "Enter the Coulmn Number which is an integer "
 		continue;
	fi
	if [[ $input > $colnum_num ]];then
		continue;
	else
		awk -F: -v i="$input" '{print $i}' $tname
		break;
	fi

	if [[ $ans != [yYnN] ]]                     
       	then
            read -p "Please enter either y or n " ans

           elif [[ $ans = [yY] ]]
            then
			bycols
		else
			cd ../..
			selct
    fi

done