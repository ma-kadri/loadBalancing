# Setting Default variables
version ?= v1

# building docker images
.PHONY: build
build: 
	@echo "-----  This will docker images locally, Make sure Docker daemon is Installed and Running! ----- "
	docker build -t ${version} --build-arg version_no=${version} . --no-cache