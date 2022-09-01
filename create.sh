#!/bin/bash
function create {
while true
do
echo "Enter Database Name:"
read dbname
if [[ $dbname =~ [\&@!#$%^/.:\|\-] ]]
then
	echo "Cant Create Database With That Name"

elif [[ $dbname = "" ]]
then
	echo "Please enter a correct name"
elif [[ ! -d $dbname ]] #if no directory wth that name
then
	mkdir ./$dbname
	break
else
	echo "Database Exist"
	
fi
done
}
export -f create
