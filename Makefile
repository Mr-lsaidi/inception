of=""
ports=""

compose-down: ## Build the container without caching
	docker build --no-cache -t $(of) .

add_mariadb_ip: 
	sh ./srcs/requirements/tools/updateIP.sh

build: add_mariadb_ip ## setup all services (wordpress, mariadb, nginx)
	docker-compose -f ./srcs/docker-compose.yml up --build

up:  ## setup all services (wordpress, mariadb, nginx)
	docker-compose -f ./srcs/docker-compose.yml up

down: ## stop all services (wordpress, mariadb, nginx)
	docker-compose down

start:  ## Start and run container
	docker run -p $(ports) -d $(of)

stop: ## Stop and remove a running container
	docker stop $(of); docker rm $(of)

help: ## usagey
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-24s:\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

