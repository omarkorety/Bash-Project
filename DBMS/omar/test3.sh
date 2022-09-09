#!/bin/bash

read -p "whitch table u want to select from" tname
        num_of_rows=$(awk -F: 'END{print NR}' $tname)
        if [  -f $tname ];then
            field=$(awk -F":" '{print $0}' $tname|cut -d: -f1 |head -1)

            read  -p "please Enter $field to print" input

            if ! [[ $input =~ ^[0-9]+$ ]]; then
		read  -p "please Enter $field to print" input	
            else
		              grep -i -w $input $tname

            fi


            
        else
            echo " dosen't exist"
		    byrow
        fi

