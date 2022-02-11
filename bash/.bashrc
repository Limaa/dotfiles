#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source profile
[ -f "${HOME}/.config/shell/profile" ] && . "${HOME}/.config/shell/profile"

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Prompt
eval "$(starship init bash)"
