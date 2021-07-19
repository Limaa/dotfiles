#!/bin/bash

packages=(
# Base
	wget
	curl
	neovim
	tmux
# C/C++
	cmake
	ninja
	gcc
	gtest
	clang
# Python
	python
	python-pip
# Shell
	shellcheck
)

command -v pacman 1>/dev/null 2>&1 && sudo pacman -Sy --needed --noconfirm "${packages[@]}"
