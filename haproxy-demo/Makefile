HAPROXY=~/projs/haproxy-1.8/haproxy

.PHONY: run
run:
	docker run --rm -d -p 2222:22 --name ssh --env ROOT_PASSWORD=test  hermsi/alpine-sshd

.PHONY: stop
stop:
	docker kill ssh


.PHONY: ha-v
ha-v:
	$(HAPROXY) --version

.PHONY: proxy
proxy:
	@rm -rf ./pids
	$(HAPROXY) -f ./haproxy.cfg -p ./pids -D
	netstat -ltnp

.PHONY: ha
ha:
	$(HAPROXY) -f ./haproxy.cfg -p ./pids -D  -sf `cat ./pids`
	netstat -ltnp


.PHONY: kill
kill:
	kill -9 `cat ./pids`
