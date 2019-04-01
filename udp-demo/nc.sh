#!/bin/bash

IP=10.244.0.122

while :
do
	echo `date` "Who are you?" | nc -u $IP 7778 -w 1
done
