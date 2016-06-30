IMAGE_NAME := packer
IMAGE_TAG := latest
IMAGE := $(IMAGE_NAME):$(IMAGE_TAG)

BUILD_ARGS := -q

.phony : container
container :
	@echo "Building Container: $(IMAGE)"
	@docker build \
		-t $(IMAGE) \
		$(BUILD_ARGS) \
		packer/

.phony : ami
ami : container
	@echo "Building AMI..."
	@docker run \
		-it \
		--rm \
		-v $(shell readlink -m ~/.aws):/root/.aws:ro \
		-v $(PWD):/code:ro \
		-w /code/packer \
		$(IMAGE) \
		|| true
