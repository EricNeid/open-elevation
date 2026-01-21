version = 0.2.1

image  = ericneid/open-elevation:$(version)
output = ericneid_open-elevation_$(version).docker.img
container = podman

.PHONY: build
build:
	$(container) build --no-cache --build-arg BUILD_VERSION=$(version) -t $(image) .

.PHONY: run
run:
	$(container) run -it $(image)

.PHONY: save
save:
	$(container) save $(image) --output $(output)

.PHONY: clean
clean:
	$(container) rmi --force $(image)
