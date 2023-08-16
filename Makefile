NAME = x11vnc-desktop-chrome
VERSION = 22.04-1.0

.PHONY: build build-nocache

BUILD_ARGS = 

ifdef http_proxy
	BUILD_ARGS += --build-arg http_proxy=$(http_proxy)
endif

ifdef https_proxy
	BUILD_ARGS += --build-arg https_proxy=$(https_proxy)
endif

build:
	docker build -t $(NAME):$(VERSION) $(BUILD_ARGS) --rm .
	docker tag $(NAME):$(VERSION) $(NAME):latest

build-nocache:
	docker build -t $(NAME):$(VERSION) $(BUILD_ARGS) --no-cache --rm .
	docker tag $(NAME):$(VERSION) $(NAME):latest
