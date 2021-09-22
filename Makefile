.PHONY: docker-build \
docker-push

IMG ?= rchari/gitlab-acquia-ci
VERSION ?= v0.0.1

docker-build:
	docker build -t ${IMG}:${VERSION} ./

docker-push:
	docker push ${IMG}:${VERSION}
