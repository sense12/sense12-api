
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

.PHONY: dev
venv:
	python3 -m venv ./venv
	pip install -r requirements.txt

.PHONY: codegen
codegen:
	swagger_py_codegen -s api/sense-api.yaml oldem/sense -p server

.PHONY: swagger_host
swagger_host: # this relies on npm http-server
	http-server --cors -p 8089 openapi

