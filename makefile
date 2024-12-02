
PROJECT_NAME := my-project
COMPOSE_FILE := compose.yml
CONTAINER_NAME := ollama_container

.PHONY: all create-directories create-volumes up pull-bge-m3 clean

all: create-directories create-volumes up pull-bge-m3

create-directories:
	mkdir -p ollama-local open-webui-local documents

create-volumes:
	docker volume create ollama-local
	docker volume create open-webui-local

up:
	docker compose -p $(PROJECT_NAME) -f $(COMPOSE_FILE) up --build -d

pull-bge-m3:
	docker exec $(CONTAINER_NAME) ollama pull bge-m3:latest
	docker exec $(CONTAINER_NAME) ollama pull llama2

clean:
	rm -rf ollama-local open-webui-local


