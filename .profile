# vim: ft=sh

### ENVIRONMENT VARIABLES ###
# Other directories with binaries
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/share/go/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.gem/ruby/2.7.0/bin"
export PATH="$PATH:$HOME/.gem/ruby/3.0.0/bin"

# Fixes some Java apps on tiling window managers
export _JAVA_AWT_WM_NONREPARENTING=1

# Configuration for the editor
export VISUAL=nvim
export EDITOR=nvim


###### FD CONFIG ######
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'


###### GO CONFIG ######
export GOPATH="$HOME/.local/share/go"


###### RUST CONFIG ######
# export CARGO_TARGET_DIR="$HOME/.cache/cargo"


###### NNN CONFIG ######
# Use editor by default
export NNN_OPTS="e"
# Use trash instead of removing completely
export NNN_TRASH=1
