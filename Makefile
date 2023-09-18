NAME = chatgpt-next-web
VERSION = 20230918

.PHONY: build start push

build: build-version

build-version:
	sudo nerdctl build -t swr.lan.aiminjie.com/amj/${NAME}:${VERSION}  . --build-arg https_proxy=http://10.0.1.116:7890

tag-latest:
	sudo nerdctl tag swr.lan.aiminjie.com/amj/${NAME}:${VERSION} swr.lan.aiminjie.com/amj/${NAME}:latest

start:
	sudo nerdctl run -it --rm swr.lan.aiminjie.com/amj/${NAME}:${VERSION} /bin/bash

push: build-version tag-latest
	sudo nerdctl push swr.lan.aiminjie.com/amj/${NAME}:${VERSION}; sudo nerdctl push swr.lan.aiminjie.com/amj/${NAME}:latest
