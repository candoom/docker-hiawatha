all:
	@echo "make build -- build docker images"
	@echo "make start -- run container"
	@echo "make stop -- stop container"

build:
	docker build --no-cache --rm -t my_hiawatha .

start:
	docker run --name HIAWATHA -p 80:80 -d my_hiawatha

stop:
	docker stop HIAWATHA
	docker rm $(docker ps -a -q)

clean:
	-@docker images -q | xargs docker rmi


