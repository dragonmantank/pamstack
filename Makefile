ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

rebuild:
	docker build -t pamstack -f docker/Dockerfile .

deploy: rebuild
	docker rm -f pamstack && docker run -p 8080:80 -d -v $(ROOT_DIR)/functions/:/var/www/functions -v $(ROOT_DIR)/source/:/var/www/source/ --name pamstack pamstack