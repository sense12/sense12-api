#Usage: make codegen ymlfile=openapi/onboard-api.yaml
codegen: venv
	swagger_py_codegen -s $(ymlfile) ../oldem/sense -p oldem.sense.api
  
swagger_host:
	http-server --cors -p 8089 openapi
