
.PHONY: package
package:
	python setup.py sdist

.PHONY: dev
dev:
	python3 -m venv ./venv

.PHONY: codegen
codegen:
	swagger_py_codegen -s api/sense-api.yaml oldem/sense -p server

.PHONY: swagger_host
swagger_host: # this relies on npm http-server
	http-server --cors -p 8089 openapi
