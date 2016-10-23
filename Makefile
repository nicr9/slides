docker_tag=latest
docker_img=nicr9/slides
container_name=slides_test


build:
	docker build -t ${docker_img}:${docker_tag} .

test: build down
	docker run \
		--name ${container_name} \
		-p 8000:8000 \
		-d \
		${docker_img}:${docker_tag}

push: build
	docker push ${docker_img}:${docker_tag}

down:
	docker rm -f ${container_name} || true

bash:
	docker exec -it ${container_name} bash

deploy:
	kubectl apply -f manifests/slides-service.yaml
	kubectl apply -f manifests/slides-deployment.yaml

teardown:
	kubectl delete -f manifests/slides-service.yaml
	kubectl delete -f manifests/slides-deployment.yaml

open:
	google-chrome --incognito `minikube service slides --url`
