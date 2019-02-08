#! /bin/bash

for host in $*;
do
	docker inspect -f '{{range .NetworkSettings.Networks}} {{.IPAddress}}{{end}}' $host
done
