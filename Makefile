docker_tag=latest
docker_img=nicr9/slides
container_name=slides_test


build:
	docker build -t ${docker_img}:${docker_tag} .

test: build down
	docker run \
		--name ${container_name} \
		-p 8000:8000 \
		-v `pwd`/open_source:/opt/reveal.js/open_source \
		-v `pwd`/groupie:/opt/reveal.js/groupie \
		-v `pwd`/openshift-authz:/opt/reveal.js/openshift-authz \
		-d \
		${docker_img}:${docker_tag}
	google-chrome --incognito 0.0.0.0:8000

push: build
	docker push ${docker_img}:${docker_tag}

down:
	docker rm -f ${container_name} || true

bash:
	docker exec -it ${container_name} bash
