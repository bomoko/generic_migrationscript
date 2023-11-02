.PHONY: build
build:
	docker build -f Dockerfile --no-cache -t bomoko/clustermigrator:latest ./ --no-cache
	

.PHONY: push
push: build
	docker push bomoko/clustermigrator:latest