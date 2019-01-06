
.PHONY: build
build: clean venv codegen
	python setup.py sdist

.PHONY: verify-build
verify-build:
	python3 -m venv ./test-build
	./bin/verify-local.sh

.PHONY: release
release: clean
	./bin/version bump --increment minor
	$(MAKE) dist

.PHONY: clean
clean:
	rm -rf dist/

.PHONY: venv
venv:
	python3 -m venv ./venv
	pip install -r requirements.txt


.PHONY: swagger_host
swagger_host: # this relies on npm http-server
	http-server --cors -p 8089 openapi

.PHONY: shell
shell:
	docker run -ti -v $(shell pwd):/tmp/build -w /tmp/build --entrypoint sh sense12/python-builder:0.1.0-alpha1

.PHONY: connexion_server
connexion_server:  # generate connexion python flask
	 # https://github.com/zalando/connexion
	 docker run --rm -v $(shell pwd):/local swaggerapi/swagger-codegen-cli generate -i /local/api/swagger2.0.yaml -l python-flask -o /local/generated

.PHONY: flask_server
flask_server:  # generate a flask server
	# https://github.com/guokr/swagger-py-codegen
	swagger_py_codegen -s api/swagger2.0.yaml oldem/sense -p server
