version = 0.1.1

image  = ericneid/open-elevation:$(version)
output = ericneid_open-elevation_$(version).docker.img


build:
	docker build -t $(image) .

save:
	docker save $(image) --output $(output)

clean:
	docker rmi --force $(image)

all: build save clean
