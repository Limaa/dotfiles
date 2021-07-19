#!/bin/bash

modules=(
	neovim
	docopt
	jinja2
	pandas
	numpy
)

pip install ${modules[@]}
