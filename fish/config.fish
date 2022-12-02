# unset the greeting
set fish_greeting


# Load private config
# (local settings or computer specific config for example)
if [ -f $HOME/.config/fish/private.fish ]
    source $HOME/.config/fish/private.fish
end

# Editor
set -x EDITOR nvim
set -x GIT_EDITOR $EDITOR
set -x SUDO_EDITOR "rvim -u NONE"

## ENV

# Fish 3.1+ doesn't add binaries to the path autmatically anymore
# https://github.com/fish-shell/fish-shell/issues/6594
contains /usr/local/bin $PATH
or set PATH /usr/local/bin $PATH

# Source env files form the ./env directory
if [ -f $HOME/.config/fish/env/index.fish ]
    source $HOME/.config/fish/env/index.fish
end
