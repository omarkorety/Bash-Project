#!/bin/bash
function const {
if [[ "$1" =~ [\&@!#$%^/.:\|\-] ]] || [[ $1 = "" ]]
then
	echo "Wrong Input"
if [[ ! "$1" =~ ^[0-9]+$ ]] ; then
   	echo "Value must be an integer!"
}

