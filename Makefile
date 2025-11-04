IMAGE_NAME=hauto.database
CONTAINER_NAME=hauto.database
PORT=5432

.PHONY: build run exec stop clean all

build:
	@docker build -t ${IMAGE_NAME} .

run:
	@docker run -d --env-file .env --name ${CONTAINER_NAME} -p ${PORT}:${PORT} ${IMAGE_NAME}

exec:
	@docker exec -it ${CONTAINER_NAME} bash

stop:
	@docker stop ${CONTAINER_NAME}

clean:
	@docker rm ${CONTAINER_NAME}
	@docker rmi ${IMAGE_NAME}

deploy:
	git tag -d $(tag)
	git push -d origin $(tag)
	git tag $(tag)
	git push origin $(tag)