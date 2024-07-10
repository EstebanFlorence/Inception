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
		@docker compose -f ${DOCKER_COMPOSE} build --no-cache

up:
		@echo "${ITALIC}${BOLD}${GREEN}Starting Inception${CLR_RMV}"
		@docker compose -f ${DOCKER_COMPOSE} up -d

down:
		@echo "${ITALIC}${BOLD}${RED}Shutdown${CLR_RMV}"
		@docker compose -f ${DOCKER_COMPOSE} down

clean:	down
		@echo "${ITALIC}${BOLD}${PURPLE}Cleaning${CLR_RMV}"
		@docker system prune -a --volumes

cleanvol:
		@echo "${ITALIC}${BOLD}${RED}Removing Volumes${CLR_RMV}"
		@if docker volume ls | grep -q 'db'; then \
			docker volume rm -f db; \
		fi
		@if docker volume ls | grep -q 'wp'; then \
			docker volume rm -f wp; \
		fi
		@sudo rm -rf /home/${USER}/data
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

rm:		clean cleanvol

re:		clean build


# Debug
logs:
		@echo "${ITALIC}${BOLD}${YELLOW}Logs${CLR_RMV}"
		@docker compose -f ${DOCKER_COMPOSE} logs
		@echo "${ITALIC}${BOLD}${YELLOW}NGINX Access Logs${CLR_RMV}"
		@docker exec NGINX cat /var/log/nginx/access.log

errors:
		@echo "${ITALIC}${BOLD}${PURPLE}mariadb${CLR_RMV}"
		@docker exec mariadb cat /var/log/mysql/error.log
		@echo "${ITALIC}${BOLD}${PURPLE}wordpress${CLR_RMV}"
		@docker exec wordpress cat /var/log/php83/error.log
		@echo "${ITALIC}${BOLD}${PURPLE}nginx${CLR_RMV}"
		@docker exec nginx cat /var/log/nginx/error.log

IMAGE_NAME = wordpress

explore:
		@clear
		@echo "${ITALIC} ${BOLD} ${PURPLE} ${IMAGE_NAME} ${CLR_RMV}"
		@docker exec -it ${IMAGE_NAME} /bin/sh


.PHONY: build up down clean cleanvol ls logs explore re