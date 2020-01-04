.PHONY: build run

name = josephharrisonlim/minecraft:1.14.1.4

build:
	docker build -t $(name) .

run:
	docker run --rm $(name)
