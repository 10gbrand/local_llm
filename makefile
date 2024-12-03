
PROJECT_NAME := my-project
COMPOSE_FILE := compose.yml
CONTAINER_NAME := ollama_container

.PHONY: all create-directories create-volumes up pull-models clean

all: create-directories create-volumes up pull-bge-m3

create-directories:
	mkdir -p ollama-local open-webui-local documents

create-volumes:
	docker volume create ollama-local
	docker volume create open-webui-local

up:
	docker compose -p $(PROJECT_NAME) -f $(COMPOSE_FILE) up --build -d

pull-models:
	# docker exec $(CONTAINER_NAME) ollama pull bge-m3:latest
	docker exec $(CONTAINER_NAME) ollama pull llama2
	docker exec $(CONTAINER_NAME) ollama pull fcole90/ai-sweden-gpt-sw3:1.3b

clean:
	rm -rf ollama-local open-webui-local


