
VERSION=$(shell cat ./VERSION)

.PHONY: package
dist:
	python setup.py sdist

.PHONY: verify-build
verify-build: # install-build
	./bin/verify-local.sh

.PHONY: install-build
install-build:
	./bin/install-dist.sh

.PHONY: release
release: clean
	./bin/version bump --increment minor
	$(MAKE) dist

.PHONY: clean
clean:
	rm -rf dist/

.PHONY: dev
dev:
	python3 -m venv ./venv

.PHONY: codegen
codegen:
	swagger_py_codegen -s api/sense-api.yaml oldem/sense -p server

.PHONY: swagger_host
swagger_host: # this relies on npm http-server
	http-server --cors -p 8089 openapi
