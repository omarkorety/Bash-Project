#!/bin/bash
primcol=($(awk -F:  '{ if (NR > 1) print $1}' test))
echo ${primcol[@]}
echo $primcol

read -p "enter " input

		for item in "${primcol[@]}"; do
			echo $item
			if [[ $item -eq $input ]];then
					echo "found"
					break;
				else
					echo "not found"
					continue;
			fi
			
				
				
		done