#!/bin/bash
function create {
while true
do
echo "Enter Database Name:"
read dbname
if [[ ! $dbname =~ ^[a-zA-Z]+$ ]] 
then
	echo "Cant Create Database With That Name"
	
elif [[ ! -d ./DBMS/$dbname ]] #if no directory wth that name
then
	mkdir -p ./DBMS/$dbname
	echo -e "successfully created \n please press Enter to get back to the Main Menu"
	break
else
	echo "This database already exists."
	
fi
done
}
export -f create
