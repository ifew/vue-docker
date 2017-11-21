image-dev:
	docker image build -f Dockerfile_build -t web_dev .
install-dev:
	docker container run -it -p 5000:8080 --rm -v $(PWD):/frontend/src -t web_dev
run-dev:
	docker container run -it -p 5000:8080 --rm -v $(PWD):/frontend/src -t web_dev run dev
build-dev:
	docker container run -it -p 5000:8080 --rm -v $(PWD):/frontend/src -t web_dev run build
test-dev:
	docker container run -it -p 5000:8080 --rm -v $(PWD):/frontend/src -t web_dev run test

image:
	docker image build -f Dockerfile -t web .
start:
	docker container run -d -p 5000:80 --name web01 -t web
stop:
	docker container rm -f web01

clean:
	docker container prune
	docker image prune
	docker volume prune
	#docker system prune