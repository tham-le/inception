up:
	sudo mkdir -p /home/thi-le/data/wp-files/
	sudo mkdir -p /home/thi-le/data/wp-db/
	sudo mkdir -p /home/thi-le/data/website-files/
	docker compose -f srcs/docker-compose.yml up --build -d

down:
	docker compose -f srcs/docker-compose.yml down

fclean:
	-docker rm -f `docker ps -aq`
	-docker volume rm -f `docker volume ls -q`
	-docker image rm -f `docker image ls -aq`
	-docker network rm -f `docker network ls -q`
	-docker builder prune --all --force
	sudo rm -rf /home/thi-le/data/wp-files/ /home/thi-le/data/wp-db/ /home/thi-le/data/website-files/

re:
	@make --no-print-directory down
	@printf "[DOWN]\n"
	@make --no-print-directory up
	@printf "[UP]\n"
