
.PHONY: package
package:
	python setup.py sdist

.PHONY: dev
dev:
	python3 -m venv ./venv

codegen: venv
	swagger_py_codegen -s api/sense-api.yaml oldem/sense -p oldem.sense.api

swagger_host:
	http-server --cors -p 8089 openapi
