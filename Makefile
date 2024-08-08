NAME = chatgpt-next-web
VERSION = 20240808

.PHONY: build start push

build: build-version

build-version:
	docker build -t swr.lan.aiminjie.com/amj/${NAME}:${VERSION}  . --build-arg https_proxy=http://10.0.1.116:7890

tag-latest:
	docker tag swr.lan.aiminjie.com/amj/${NAME}:${VERSION} swr.lan.aiminjie.com/amj/${NAME}:latest

start:
	docker run -it --rm swr.lan.aiminjie.com/amj/${NAME}:${VERSION} /bin/sh

push: build-version tag-latest
	docker push swr.lan.aiminjie.com/amj/${NAME}:${VERSION}; docker push swr.lan.aiminjie.com/amj/${NAME}:latest
