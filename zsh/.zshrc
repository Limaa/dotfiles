#!/usr/bin/env zsh

################################################################################
# Shell Profile
################################################################################
source "${HOME}/.config/shell/profile"

################################################################################
# Data and Cache dirs
################################################################################
mkdir -p "${XDG_CACHE_HOME}/zsh"
mkdir -p "${XDG_DATA_HOME}/zsh"

################################################################################
# History
################################################################################
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE="${XDG_DATA_HOME}/zsh/zsh_history"

setopt EXTENDED_HISTORY       # Timestamp and elapsed time
setopt SHARE_HISTORY          # Share history among openzsh sessions
setopt APPEND_HISTORY         # Append to history instead of overwriting
setopt INC_APPEND_HISTORY     # Update after every command, rather than waiting for the shell to exit
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicates first
setopt HIST_IGNORE_DUPS       # Do not store duplications
setopt HIST_FIND_NO_DUPS      # Ignore duplicates when searching
setopt HIST_REDUCE_BLANKS     # Removes blank lines from history

################################################################################
# Plugins
################################################################################
fpath=(
	${XDG_CONFIG_HOME}/shell/zsh/prompts
	${XDG_CONFIG_HOME}/shell/zsh/zsh-completions
	/usr/local/share/zsh/site-functions
	$fpath
)

source "${XDG_CONFIG_HOME}/shell/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "${XDG_CONFIG_HOME}/shell/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "${XDG_CONFIG_HOME}/shell/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"
source "${XDG_CONFIG_HOME}/shell/zsh/prompts/prompts.zsh"

autoload -Uz compinit && compinit -d "${XDG_CACHE_HOME}/zsh/zcompdump-${ZSH_VERSION}"

################################################################################
# User configuration
################################################################################
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^n' autosuggest-accept

################################################################################
# FZF
################################################################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

################################################################################
# Source local zshrc
################################################################################
[ -f "${XDG_CONFIG_HOME}/zsh/zshrc.local" ] && . "${XDG_CONFIG_HOME}/zsh/zshrc.local"
