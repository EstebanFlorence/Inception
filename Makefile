# Makefile

DOCKER_COMPOSE = srcs/docker-compose.yml

CLR_RMV		=	\033[0m
BOLD		=	\033[1m
ITALIC		=	\033[3m
BLUE		=	\033[1;34m
YELLOW		=	\033[1;33m
PURPLE		=	\033[1;35m
GREEN		=	\033[1;32m
RED		    =	\033[1;31m

build:
		@echo "${ITALIC}${BOLD}${BLUE}Building${CLR_RMV}"
		@docker compose -f ${DOCKER_COMPOSE} build --build-arg USER=${USER} --no-cache

up:
		@echo "${ITALIC}${BOLD}${GREEN}Starting Inception${CLR_RMV}"
		@docker compose -f ${DOCKER_COMPOSE} up -d

down:
		@echo "${ITALIC}${BOLD}${RED}Shutdown${CLR_RMV}"
		@docker compose -f ${DOCKER_COMPOSE} down

clean:	down
		@docker system prune -a --volumes
		@docker builder prune

cleanvol:
		@echo "${ITALIC}${BOLD}${RED}Removing Volumes${CLR_RMV}"
		@if docker volume ls | grep -q 'db-data'; then \
			docker volume rm db-data; \
		fi
		@if docker volume ls | grep -q 'wp-data'; then \
			docker volume rm wp-data; \
		fi
		@rm -rf /home/${USER}/data
		@mkdir -p /home/${USER}/data/db /home/${USER}/data/wp

ls:
		@echo "${ITALIC}${BOLD}${YELLOW}Volumes:${CLR_RMV}"
		@docker volume ls
		@echo "${ITALIC}${BOLD}${YELLOW}Networks:${CLR_RMV}"
		@docker network ls
		@echo "${ITALIC}${BOLD}${YELLOW}Images:${CLR_RMV}"
		@docker images -a
		@echo "${ITALIC}${BOLD}${YELLOW}Containers:${CLR_RMV}"
		@docker compose -f ${DOCKER_COMPOSE} ps -a

re:		clean build


# Debug
logs:
		@echo "${ITALIC}${BOLD}${YELLOW}Logs${CLR_RMV}"
		@docker compose -f ${DOCKER_COMPOSE} logs

IMAGE_NAME = srcs-mariadb:latest

explore:
		@echo "${ITALIC} ${BOLD} ${PURPLE} ${IMAGE_NAME} ${CLR_RMV}"
		@docker run -it --rm ${IMAGE_NAME} sh


.PHONY: build up down clean fclean clean-volumes logs re