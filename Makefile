WORK_DIR := $(shell pwd)
docker-login:
	docker login -u ${DOCKER_HUB_USER} -p ${DOCKER_HUB_PASSWORD} 

start_db:
	docker run -d -p 5432:5432 -e POSTGRES_USER=${DB_USER} -e POSTGRES_PASSWORD=${DB_PASSWORD} -e POSTGRES_DB=${DB_NAME} postgres

migrate:
	docker run --rm --network host -v $(WORK_DIR)/migration:/migrations migrate/migrate -path /migrations/ -database "${DB_URL}" up

start: 
	go build
	./sample	