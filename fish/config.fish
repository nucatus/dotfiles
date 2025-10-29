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

# Source aliases from the ./alias directory
if [ -f $HOME/.config/fish/alias/index.fish ]
  source $HOME/.config/fish/alias/index.fish
end

export KUBECONFIG=$HOME/.kube/config:$HOME/.kube/sepiat-stage/config:$HOME/.kube/sepiat-prod/config:$HOME/.kube/sepiat-int/config:$HOME/.kube/sepiat-infra/config
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

set -x JAVA_HOME (/usr/libexec/java_home -v 25)


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nucatus/opt/google-cloud/google-cloud-sdk/path.fish.inc' ]; . '/Users/nucatus/opt/google-cloud/google-cloud-sdk/path.fish.inc'; end


# change the key binding for the fzf file widget
bind -e \ct                     # unbind the original Ctrl-T
bind \cf fzf-file-widget        # bind Ctrl-F to the fzf file widget

bind -e \ec
bind \cl fzf-cd-widget

# set the defaults for fzf
set -gx FZF_DEFAULT_OPTS "
  --layout=reverse --inline-info --height=40% 
  --preview 'bat --color=always --style=numbers,changes {}' 
  --bind 'shift-up:preview-page-up,shift-down:preview-page-down'
"
