docker_tag=latest
docker_img=nicr9/slides
container_name=slides_test


build:
	docker build -t ${docker_img}:${docker_tag} .

test:
	docker run \
		--name ${container_name} \
		-p 80:8000 \
		-d \
		${docker_img}:${docker_tag}

push:
	docker push ${docker_img}:${docker_tag}

down:
	docker rm -f ${container_name}

bash:
	docker exec -it ${container_name} bash

deploy:
	kubectl apply -f manifests/slides-service.yaml
	kubectl apply -f manifests/slides-deployment.yaml
