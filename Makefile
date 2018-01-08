# Build options
IMAGE_NAME?=steamcmd
IMAGE_TAG?=alpha

DOCKER_NO_CACHE?=false

# Publish options
DOCKER_HUB_ACCOUNT?=leangaming
DOCKER_PUBLISH_NAME?=$(DOCKER_HUB_ACCOUNT)/$(IMAGE_NAME)
DOCKER_PUBLISH_TAG?=$(IMAGE_TAG)

.PHONY: build
build:
	docker build -f Dockerfile --no-cache=$(DOCKER_NO_CACHE) \
	-t $(IMAGE_NAME):$(IMAGE_TAG) .

.PHONY: clean
clean:
	-docker rmi $(IMAGE_NAME):$(IMAGE_TAG)

.PHONY: publish
publish:
	docker tag $(IMAGE_NAME):$(IMAGE_TAG) $(DOCKER_PUBLISH_NAME):$(DOCKER_PUBLISH_TAG)
	docker push $(DOCKER_PUBLISH_NAME):$(DOCKER_PUBLISH_TAG)
