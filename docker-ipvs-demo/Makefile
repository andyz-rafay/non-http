
VIP=1.2.3.4

.PHONY: run
run:
	docker run --rm -d -v "$(CURDIR)/srv/A:/usr/share/nginx/html" --name nginx-A nginx
	docker run --rm -d -v "$(CURDIR)/srv/B:/usr/share/nginx/html" --name nginx-B nginx
	docker-ip.sh nginx-A nginx-B

.PHONY: stop
stop:
	docker kill nginx-A nginx-B


.PHONY: mod
mod:
	sudo lsmod

.PHONY: conf
conf:
	sudo ipvsadm -C
	sudo ipvsadm -A -t $(VIP):80 -s rr
	sudo ipvsadm -a -t $(VIP):80 -r 172.17.0.2 -m 
	sudo ipvsadm -a -t $(VIP):80 -r 172.17.0.3 -m 



.PHONY: info
info:
	sudo ipvsadm -l --timeout
	sudo ipvsadm -L -n --stats --rate
