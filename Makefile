up:
	export DOCKER_HOST="ssh://root@localhost:2424"
	ssh -p 2424 root@localhost 'mkdir -p /home/thi-le/data/wp-files/ /home/thi-le/data/mariadb-db/ '
	docker compose -f srcs/docker-compose.yml up -d --build
	@echo "Containers are up and running."

down:
	docker compose -f srcs/docker-compose.yml down
	@echo "Containers are down."


fclean:
	@printf "Are you sure you want to delete all data? [y/N] "; \
	read REPLY; \
	if [ "$${REPLY}" = "Y" -o "$${REPLY}" = "y" ]; then \
		make --no-print-directory down; \
		docker system prune --all --volumes --force; \
		docker volume rm srcs_wp-files srcs_mariadb-db; \
		ssh -p 2424 root@localhost 'rm -rf /home/thi-le/data/wp-files/ /home/thi-le/data/wp-db/ /home/thi-le/data/mariadb-db/'; \
	fi

re:
	@make --no-print-directory down
	@make --no-print-directory up
