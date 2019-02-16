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

do_cmd sudo apt install ebtables ethtool socat curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
do_cmd sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

do_cmd sudo apt install -y kubeadm=1.12.5-00 kubelet=1.12.5-00

# Turn off swap
do_cmd sudo swapoff -a 

# Start k8s master
do_cmd sudo kubeadm init --kubernetes-version 1.12.5 --ignore-preflight-errors=all --pod-network-cidr=10.244.0.0/16

setup_kubectl

taint_master

do_cmd kubectl get pods --all-namespaces
