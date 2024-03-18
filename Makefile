NAME = chatgpt-next-web
VERSION = 20240318

.PHONY: build start push

build: build-version

build-version:
	docker buildx build -t swr.lan.aiminjie.com/amj/${NAME}:${VERSION}  . --build-arg https_proxy=http://10.0.1.116:20172

tag-latest:
	docker tag swr.lan.aiminjie.com/amj/${NAME}:${VERSION} swr.lan.aiminjie.com/amj/${NAME}:latest

start:
	docker run -it --rm swr.lan.aiminjie.com/amj/${NAME}:${VERSION} /bin/bash

push: build-version tag-latest
	docker push swr.lan.aiminjie.com/amj/${NAME}:${VERSION}; docker push swr.lan.aiminjie.com/amj/${NAME}:latest
