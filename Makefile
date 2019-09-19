IMAGE := codejamninja/kube-api-proxy
VERSION := 0.1.0

MAJOR := $(shell echo $(VERSION) | cut -d. -f1)
MINOR := $(shell echo $(VERSION) | cut -d. -f2)
PATCH := $(shell echo $(VERSION) | cut -d. -f3)

.EXPORT_ALL_VARIABLES:

.PHONY: all
all: clean build

.PHONY: build
build:
	@docker-compose -f docker-build.yaml build

.PHONY: pull
pull:
	@docker-compose -f docker-build.yaml pull

.PHONY: push
push:
	@docker-compose -f docker-build.yaml push

.PHONY: run
run: build
	@docker run --rm -p 8080:8080 $(IMAGE):latest

.PHONY: ssh
ssh: build
	@docker run --rm -it --entrypoint /bin/sh $(IMAGE):latest

.PHONY: up
up: build
	@docker-compose up
