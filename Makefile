COMPOSE_BUILD_MUSKETEERS = docker-compose build musketeers
COMPOSE_RUN_MUSKETEERS = docker-compose run --rm musketeers
ENVFILE ?= .env.template

all:
	ENVFILE=.env.example $(MAKE) envfile build test clean

travisPullRequest: envfile build test clean

travisMasterChange: envfile build test dockerhubBuild clean

envfile:
	cp -f $(ENVFILE) .env

build:
	$(COMPOSE_BUILD_MUSKETEERS)

test:
	$(COMPOSE_RUN_MUSKETEERS) ./scripts/test.sh

shell:
	$(COMPOSE_RUN_MUSKETEERS)

clean:
	docker-compose down --remove-orphans
	rm -f .env

dockerhubBuild:
	$(COMPOSE_RUN_MUSKETEERS) ./scripts/dockerhub-build.sh
