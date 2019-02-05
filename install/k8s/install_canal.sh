#!/bin/bash
OUT=/tmp/install_canal.out

run()
{
	"$@" | tee $OUT
	return ${PIPESTATUS[0]}
}

do_cmd()
{
	run echo "*****************************************" 
	run echo "CMD: $@ "
	run echo "*****************************************"
	run "$@" 
	ret=$?

	if [[ $ret -eq 0 ]]
	then
	    run echo "Successfully ran [ $@ ]"
    	else
	    run echo "Error: Command [ $@ ] returned $ret"
	    exit $ret
    	fi
}


echo > $OUT

# Start k8s master
do_cmd kubectl apply -f rbac.yaml
do_cmd kubectl apply -f canal.yaml

kubectl get pods --all-namespaces
