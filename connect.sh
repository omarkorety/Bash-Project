#1/bin/bash
#Connect To Database
function connect {
. ./update.sh
. ./ctable.sh
. ./ins.sh
. ./deltable.sh
. ./select.sh
echo "Avaliable DataBases"
ls ./DBMS/
read -p "Enter the database name you want to connect to: " name

cd ./DBMS
while true
do


	if [ -d "$name" ]
	then
		cd ./$name
		select choice in "Create Table" "List Tables" "Drop Table" "Insert Into Table" "Select From Table" "Delete From Table" "Update Table"	#Creating the menu
		do
			case $REPLY in
				1) ctable;;			#Create
				2) ls -I "*-meta";;			#List
				3) droptable;;	#Drop
				4) insert;;			#Insert
				5) selct;;			#Select
				6) deltable;;			#Delete
				7) update;;			#Update
			esac
			break 2
		done
	else
		read -p "This database is not available, please try again: " name
	fi
done
cd ../..
}
#####################################################################################################################################
function droptable {
  while true ;do
  read -p "Enter Table Name:" tname
  if [ ! -f $tname ]
    then
		echo "The table $tname doesn't exist"
		continue;
  fi
  if [[ $tname == "" ]];then
		echo "Really?"
		continue;
  fi
  rm $tname "${tname}-meta" 
  if [[ $? == 0 ]]
  then
    echo "Table Dropped Successfully"
  else
    echo "Error Dropping Table $tName"
    continue;
  fi
  done
  connect
}

