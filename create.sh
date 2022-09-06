#!/bin/bash
function create {
while true
do
echo "Enter Database Name:"
read dbname
if [[ ! $name =~ ^[a-zA-Z]+$ ]] 
then
	echo "Cant Create Database With That Name"
	
elif [[ ! -d ./DBMS/$dbname ]] #if no directory wth that name
then
	mkdir -p ./DBMS/$dbname
	echo -e "successfully created \n please Press Enter To Back To Main Menu"
	break
else
	echo "Database Exist"
	
fi
done
}
export -f create
