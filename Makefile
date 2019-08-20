EXEC = docker-compose exec ntopng
DID = $$(docker-compose ps -q ntopng)

GREEN = $$(tput setaf 2)
YELLOW = $$(tput setaf 3)
RESET = $$(tput sgr0)

all: help

help:                  #~ Show this help
	@fgrep -h "#~"  $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e "s/^\([^:]*\):/${GREEN}\1${RESET}/;s/#~r/${RESET}/;s/#~y/${YELLOW}/;s/#~ //"

#~y
#~ Project Setup
#~ ________________________________________________________________
#~r

install:               #~ Install and start the project
install: build start

build:                 #~ Build docker containers
	docker-compose build

start:                 #~ Start the docker containers
	docker-compose up -d

stop:                  #~ Stop the docker containers
	docker-compose stop

clean:                 #~ Clean the docker containers
clean: stop
	docker-compose rm

destroy:               #~ Remove all docker images
destroy: stop
	docker-compose down --rmi all

.PHONY: install build composer-install-run start stop clean destroy

#~y
#~ Ntop NG
#~ ________________________________________________________________
#~r

console:               #~ Open the console in docker docker
	$(EXEC) sh

logs:                  #~ Show all logs [CTRL]+[C] to exit
	docker-compose logs -f ntopng

error-logs:            #~ Show error logs only [CTRL]+[C] to exit
	docker logs -f $(DID) >/dev/null

.PHONY: console logs error-logs