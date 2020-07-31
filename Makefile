rebuild:
	docker build -t pamstack -f docker/Dockerfile .

deploy: rebuild
	docker rm -f pamstack && docker run -p 8080:80 -d --name pamstack pamstack