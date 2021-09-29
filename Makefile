.PHONY: docker-build \
docker-push \
all

IMG ?= rchari/gitlab-acquia-ci
VERSION ?= v0.0.2

all: docker-build docker-push 

docker-build:
	docker build -t ${IMG}:${VERSION} ./

docker-push:
	docker push ${IMG}:${VERSION}
