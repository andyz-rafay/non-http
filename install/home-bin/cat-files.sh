#!/bin/bash

# Cat files in single output. 

print_filename()
{
	echo
	echo "**********************************************************"
	echo FILE: "$1"
	echo "**********************************************************"
	echo 
}

for f in $*; 
do
	print_filename $f
	cat $f
done

