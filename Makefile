VERSION ?= $(shell git rev-parse --short HEAD)
PROJ_NAME ?= wavepg

.PHONY: build_conda_env
build_conda_env:
	conda create -n $(PROJ_NAME) -y python==3.10 pip jupyterlab
	conda run -n $(PROJ_NAME) --no-capture-output ./pip_install.sh

.PHONY: run_jupyterlab
run_jupyterlab:
	conda run -n $(PROJ_NAME) jupyter lab

.PHONY: fix_styles
fix_styles: build_hatch_env_style
	hatch -v run style:fmt
