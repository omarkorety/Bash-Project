#!/bin/bash
echo "Enter Database Name:"
read dbname
if [[ $dbname =~ [#@!#$%^/.:\|\-] ]];then
	echo "Cant Create Database With That Name"
elif [[ $dbname -eq "" ]]
then 
echo "Please enter a correct name"
elif [[ ! -d $dbname ]] #if no directory wth that name
then
	mkdir ./$dbname
else
	echo "Database Exist"
fi

