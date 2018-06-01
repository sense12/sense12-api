
.PHONY: package
dist:
	python setup.py sdist

.PHONY: verify-build
verify-build: install-build
	pid=$(shell ./bin/start_api.sh)
	echo pid
	$(shell curl localhost:1029/health)
	kill ${pid}


.PHONY: install-build
install-build:
	rm -rf test-build/
	python3 -m venv ./test-build
	source ./test-build/bin/activate
	pip install dist/sense12-0.1.0.tar.gz


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
