#!/bin/bash
#UPDATE

function update {
    #cd DBMS/hamada
	while true
	do
		read -p "Enter the table name: " name
		if [ -f "$name" ]
		then
			#while true
			#do
            totcol=$(awk 'END{print NR}' "${name}-meta")
            totrow=$(awk 'END{print ((NR-1)) }' "${name}")
            primcol=$(grep 'primary' "${name}-meta" | cut -d: -f1)
            primname=$(grep 'primary' "${name}-meta" | cut -d: -f2)
            while true
            do
            echo "Primary key is $primname"
            read -p "Which $primname do you want to update? " ans
            #baskoot=$(cut -d: -f${primcol} $name | grep '$ans')
                if cut -d: -f${primcol} $name | grep "$ans" >/dev/null
                then
                    row=$(cut -d: -f${primcol} $name | grep -n "$ans" | cut -d: -f1)
                    #row=$(($row-1))
                    #echo $row
                    while true
                    do
                    echo | sed -n 1p $name
                    read -p "Which column number do you want to update? " col
                    if [[ ! $col =~ ^[0-9]+$ ]] ;then
                        echo Value must be an integer!
                        continue
                    elif [[ $col -gt $totcol ]] ;then
                        echo Value is too large!
                        continue
                    elif [[ $col -le 0 ]] ;then
                        echo Value is too low!
                        continue
                    else
                        typ=$(sed -n "$col"p "${name}-meta" | cut -d: -f3)
                        #echo $typ
                        y=`awk -F: -v k="$col" '{print $k}' ${name} | sed -n ${row}p`
                        echo $y
                        while true
                        do
                        echo "The value you want to change is $y"
                        read -p "Enter your new value: " new
                        if [[ typ = [iI] ]]
                        then
                            if [[ ! $new =~ ^[0-9]+$ ]];then
                                echo Value must be an integer!
                                continue
                            else
                                echo | awk -F: -v col="$col" -v row="$row" -v y="$y" -v new="$new" -v name="$name" '{if ($col==y && NR==row) $col=new ; gsub (" ", ":", $0); print > name }' $name
                                break 4
                            fi

                        else
                            if [[ ! $new =~ ^[a-zA-Z]+$ ]];then
                                echo Value must be a string!
                                continue
                            else
                                echo | awk -F: -v col="$col" -v row="$row" -v y="$y" -v new="$new" -v name="$name" '{if ($col==y && NR==row) $col=new ; gsub (" ", ":", $0); print > name }' $name
                                #echo | awk -F: -v col="$col" -v row="$row" -v y="$y" -v new="$new" -v name="$name" '{if ($col==y && NR==row) $col=new ; print > name }' $name

                                break 4
                            fi
                        fi
                        done
                    fi
                    done
                else
                    echo "This value isn't available in the table!"
                fi
            done
        else
            echo "This table doesn't exist!"
            continue
        fi
    done
echo Please press Enter to continue..
}           