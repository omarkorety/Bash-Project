arr=($(awk -F: '{ for(i = 1; i <= NF; i++) { if (NR==1) print $i; } }' test))
echo -e " choose from those columns\n${arr[@]}"
len=${#arr[@]}
read input

if [[ $input -lt "len" ]];then
	awk -F: -v col="$input"'{print $col}' test
	else
    	echo -e "please enter num < ${#arr[@]}"
    	read input

	fi


	==========================================
	
function bycol {
	field=$(awk -F":" '{print $0}' tname|cut -d: -f1 |head -1)

	echo "please Enter $field to print"
	




arr=($(awk -F: '{ for(i = 1; i <= NF; i++) { if (NR==1) print $i; } }' test))
echo -e " choose from those columns\n${arr[@]}"
read input
while ! [[  $input =~ ^[0-9]*$ ]]; do
    echo"please enter num"
    read input
    done
if [[ $input <= ${#arr[@]} ]];then
awk -F:'{print $input}' $tname
else
    echo -e "please enter num <${#arr[@]}"
    read input