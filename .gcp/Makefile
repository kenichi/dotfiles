UID := $(shell id -u)
GID := $(shell id -g)
USERNAME := $(shell id -u -n)

default:
	@docker build \
		--build-arg UID=$(UID) \
		--build-arg GID=$(GID) \
		--build-arg USERNAME=$(USERNAME) \
		-t kenichi/gcloud \
		.
