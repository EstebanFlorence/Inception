# Makefile

DOCKER_COMPOSE = srcs/docker-compose.yml

CLR_RMV		=	\033[0m
BOLD		=	\033[1m
ITALIC		=	\033[3m
RED		    =	\033[1;31m
GREEN		=	\033[1;32m
YELLOW		=	\033[1;33m
BLUE		=	\033[1;34m
CYAN 		=	\033[1;36m

build:
		@echo -e "${BLUE}Building${CLR_RMV}"
		@docker compose -f ${DOCKER_COMPOSE} build --no-cache

up:
		@echo -e "${GREEN}Starting Inception${CLR_RMV}"
		@docker compose -f ${DOCKER_COMPOSE} up -d

down:
		@echo -e "${RED}Shutdown${CLR_RMV}"
		@docker compose -f ${DOCKER_COMPOSE} down

clean:
		@echo -e "${RED}Shutting down and cleaning Inception${CLR_RMV}"
		@docker compose -f ${DOCKER_COMPOSE} down --rmi all

fclean: clean
		@docker compose prune
		@docker builder prune
		@docker system prune

cleanvol:
		@echo -e "${RED}Removing Volumes${CLR_RMV}"
		@docker volume rm $(docker volume ls)
re:

logs:

.PHONY: build up down clean fclean clean-volumes logs re