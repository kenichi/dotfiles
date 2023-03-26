UID := $(shell id -u)
GID := $(shell id -g)
USERNAME := $(shell id -u -n)
IMAGE := google/cloud-sdk:latest

.PHONY: build pull

build: pull
	@docker build \
		--build-arg UID=$(UID) \
		--build-arg GID=$(GID) \
		--build-arg USERNAME=$(USERNAME) \
		-t $(USERNAME)/gcloud \
		.

pull:
	@docker pull $(IMAGE)
