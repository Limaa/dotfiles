#!/usr/bin/env zsh

################################################################################
# History
################################################################################
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=$XDG_DATA_HOME/zsh/zsh_history

# Timestamp and elapsed time
setopt EXTENDED_HISTORY
# Share history among openzsh sessions
setopt SHARE_HISTORY
# Append to history instead of overwriting
setopt APPEND_HISTORY
# Update after every command, rather than waiting for the shell to exit
setopt INC_APPEND_HISTORY
# Expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# Do not store duplications
setopt HIST_IGNORE_DUPS
# Ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# Removes blank lines from history
setopt HIST_REDUCE_BLANKS

################################################################################
# Plugins
################################################################################
fpath=(
	$XDG_CONFIG_HOME/shell/zsh/prompts
	$XDG_CONFIG_HOME/shell/zsh/zsh-completions
	/usr/local/share/zsh/site-functions
	$fpath
)
source $XDG_CONFIG_HOME/shell/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $XDG_CONFIG_HOME/shell/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $XDG_CONFIG_HOME/shell/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source $XDG_CONFIG_HOME/shell/zsh/prompts/prompts.zsh

autoload -Uz compinit && compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

################################################################################
# User configuration
################################################################################
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^n' autosuggest-accept

################################################################################
# Linux From Scratch
################################################################################
export LFS="$HOME/dev/lfs"
export LFS_TGT=$(uname -m)-lfs-linux-gnu

################################################################################
# NVM
################################################################################
# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

################################################################################
# Source local zshrc
################################################################################
[ -f "$XDG_CONFIG_HOME/shell/zsh/zshrc.local" ] && . "$XDG_CONFIG_HOME/shell/zsh/zshrc.local"
