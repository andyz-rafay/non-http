#!/bin/bash
echo "Hello World the time is now $(date -R)!" | tee /tmp/log.txt

OUT=/tmp/cloud_init.out

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


setup_kubectl()
{
	do_cmd mkdir -p $HOME/.kube
	do_cmd sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
	do_cmd sudo chown $(id -u):$(id -g) $HOME/.kube/config
}

taint_master()
{
	do_cmd kubectl taint nodes --all node-role.kubernetes.io/master-
}


echo > $OUT


do_cmd sudo snap install kubeadm --classic

# Start k8s master
do_cmd sudo kubeadm init --pod-network-cidr=10.244.0.0/16
setup_kubectl

taint_master

do_cmd kubectl get pods --all-namespaces
