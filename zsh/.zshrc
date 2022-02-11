#!/usr/bin/env zsh

# XDG
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}"

################################################################################
# History
################################################################################
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=${DATA_DIR}/zsh/zsh_history

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
	${CONFIG_DIR}/shell/zsh/prompts
	${CONFIG_DIR}/shell/zsh/zsh-completions
	/usr/local/share/zsh/site-functions
	$fpath
)

function install_plugin() {
	[ -f "$1" ] && source "$1"
}
install_plugin "${CONFIG_HOME}/shell/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
install_plugin "${CONFIG_HOME}/shell/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
install_plugin "${CONFIG_HOME}/shell/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"
install_plugin "${CONFIG_HOME}/shell/zsh/prompts/prompts.zsh"

autoload -Uz compinit && compinit -d "${CACHE_DIR}/zsh/zcompdump-${ZSH_VERSION}"

################################################################################
# User configuration
################################################################################
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^n' autosuggest-accept

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
