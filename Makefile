
# Setting Default variables
version ?= v1

# Setting Default Goal
.DEFAULT_GOAL:	default

.PHONY: default	
default:	
	@echo "----  This is default, pass "build" or "run" target along with relevant version \n \
		# make build version=v1 \n \
		# make build version=v2 \n \
		# make run \
    "

# building docker images
.PHONY: build
build: 
	@echo "-----  This will build docker images locally, Make sure Docker daemon is Installed and Running! ----- "
	docker build -t ${version} --build-arg version_no=${version} . --no-cache

# Running Docker Compose setup.
.PHONY: run
run: 
	@echo "-----  This will run docker containers locally, Make sure Docker daemon is Installed and Running! ----- "
	docker-compose up

# Stopping Docker Compose setup.
.PHONY: stop
stop: 
	@echo "-----  This will stop docker containers locally "
	docker-compose down