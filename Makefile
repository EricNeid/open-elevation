version = 0.2.9

image  = neidhardt/open-elevation:$(version)
output = neidhardt_open-elevation_$(version).docker.img
container = podman

.PHONY: build
build:
#$(container) build --no-cache --build-arg BUILD_VERSION=$(version) -t $(image) .
	$(container) build --build-arg BUILD_VERSION=$(version) -t $(image) .

.PHONY: run
run:
	podman compose down
	podman compose up

.PHONY: save
save:
	$(container) save $(image) --output $(output)

.PHONY: clean
clean:
	$(container) rmi --force $(image)

.PHONY: push
push:
	$(container) push --tls-verify=false $(image)
