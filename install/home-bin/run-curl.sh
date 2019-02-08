#!/bin/bash

# $1 -- IP address
# $2 -- how many times

PROG=curl

usage()
{
	echo 
 	echo "Usage:"
        echo " 	run-curl <ip-address> [ repeat-number ]"
	exit 1;
}

num=$2
[ "$num"  == "" ] && num=10

[ "$1" == "" ] && echo "Error: ip-address not specified" && usage && exit 1

for i in `seq 1 $num`; 
do
	$PROG  $1;
done
