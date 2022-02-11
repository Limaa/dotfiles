#
# ~/.bash_profile
#

[ -f "$HOME/.profile" ] && . "$HOME/.profile"

BASH_DIR="$XDG_CONFIG_HOME/shell/bash"
[ -f "$BASH_DIR/.bashrc" ] && . "$BASH_DIR/.bashrc"

