entrykit:
	curl -L https://github.com/progrium/entrykit/releases/download/v0.4.0/entrykit_0.4.0_Linux_x86_64.tgz | tar zxv

build:
	docker build -t codehopper/dcind .

e2e:
	docker run --privileged -v $(shell pwd):/src codehopper/dcind

pull:
	docker run --privileged -v $(shell pwd):/src --entrypoint switch -v $(shell pwd)/cached-graph:/cached-graph codehopper/dcind -- pull

shell:
	docker run -it --privileged -v $(shell pwd):/src --entrypoint switch -v $(shell pwd)/cached-graph:/cached-graph codehopper/dcind -- shell

push:
	docker push codehopper/dcind
