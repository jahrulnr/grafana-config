up-vm:
	if [ -z `docker network ls -qf name=vm` ]; then docker network create -d bridge vm; fi
	if [ ! -d ./data ]; then \
		mkdir -p ./data/grafana/lib \
		&& mkdir -p ./data/grafana/provisioning; \
	fi
	docker-compose --compatibility up -d

down-vm:
	docker-compose down --remove-orphans