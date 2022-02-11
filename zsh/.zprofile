#!/usr/bin/env zsh

if ! uname -s | grep -q "Darwin"; then
	[ -f "${HOME}/.zshrc" ] && source "${HOME}/.zshrc"
fi
