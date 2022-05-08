include srcs/.env
of=""
ports=""

help: ## usage
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-24s:\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	
down: rmv ## compose down all container without caching
	docker-compose --log-level CRITICAL -f ${COMPOSE_LOCATION} down -v

build: volumes set_host ## setup all services (wordpress, mariadb, nginx) + Bonus
	docker-compose --log-level CRITICAL -f ${COMPOSE_LOCATION} up --build

set_host:
	sh srcs/requirements/tools/host_name.sh ${DOMAIN_NAME}

start:  ## Start and run container | make start "YOUR PORT" "IMG ID"
	docker run -p $(ports) -d $(of)

stop: ## Stop and remove a running container | make stop "IMG ID"
	docker stop $(of); docker rm $(of)

clean_all: ## remove all conatiers and images exist
	docker rm -f `docker ps -aq`; docker rmi -f `docker images -q`

rmv:
	sudo rm -rf /home/lsaidi/data

volumes: rmv
	mkdir -p /home/lsaidi/data/db
	mkdir -p /home/lsaidi/data/wp



.DEFAULT_GOAL := help

