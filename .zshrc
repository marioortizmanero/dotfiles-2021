###### CONFIG ######
# Basic config
HIST_STAMPS="dd/mm/yyyy"
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt +o nomatch
setopt hist_ignore_all_dups


###### BINDINGS ######
# Vi mode with some vim-like tweaks
bindkey -v
export KEYTIMEOUT=1
bindkey "^?" backward-delete-char  # vim-like behaviour for backspace
bindkey "^R" history-incremental-search-backward  # restore search binding
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char 


###### PLUGINS & THEMES ######
# Pure prompt
autoload -Uz promptinit; promptinit
prompt pure


###### ALIAS & CUSTOM FUNCTIONS ######
# Shortcuts
alias :q="exit"
alias :wq="exit"
alias _rm="/bin/rm"
alias adb-restart="sudo adb kill-server && sudo adb start-server"
alias clang-format-custom="clang-format -i --style='{IndentWidth: 4, BasedOnStyle: Google}'"
alias clone='alacritty --working-directory "$PWD" -e sh -c "ls; zsh" &!'
alias cmake-debug="cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=YES -DBUILD_TESTING=YES"
alias cmake-release="cmake -DCMAKE_BUILD_TYPE=Release"
alias docker-stop-all="sudo docker ps | tail  -n +2 | awk '{ print \$1 }' | xargs sudo docker stop"
alias flake8-custom="flake8 --ignore='F821,W503,E731'"
alias getpid="xprop _NET_WM_PID | cut -d' ' -f3"
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gitclean="git branch -r | awk '{print \$1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print \$1}' | xargs git branch -d"
alias gitreset="git add -A; git reset --hard"
alias go-static="CGO_ENABLED=0 go"
alias gofmt="go fmt ./..."
alias imgs-clean-apuntes="imgs clean --clean-sources apuntes.adoc --format asciidoctor --dir images"
alias nuke="killall -s SIGKILL"
alias py="python3"
alias pylint-custom="pylint --disable import-error --disable missing-module-docstring --disable missing-class-docstring --disable missing-function-docstring --disable attribute-defined-outside-init --disable invalid-name"
alias pymake="python3 setup.py sdist bdist_wheel"
alias killsession="kill -9 -1"
alias rm="trash"
alias sizes="du -cha --max-depth=1 2>/dev/null | sort -rh | less"
# Note: scp -r a778332@hendrix-ssh.cps.unizar.es:/origin/path /dest/path
alias ssh-central="TERM=xterm ssh -l a778332 central.cps.unizar.es"
alias ssh-hendrix="TERM=xterm ssh -l a778332 hendrix-ssh.cps.unizar.es"
alias ssh-lab000="TERM=xterm ssh -l a778332 lab000.cps.unizar.es"
alias ssh-raspberry="ssh alarm@192.168.1.113"
alias vim="nvim"

# Default flags
alias diff="diff --color=auto"
alias egrep="egrep --color=auto"
alias grep="grep --color=auto"
alias less="less -R"
alias ls="ls -A --color"
alias moodle-dl="moodle-dl --path $HOME/Uni/Moodle"
alias rg="rg --hidden -g '!.git/*'"
alias yay="CARGO_TARGET_DIR= yay"  # avoids installation issues with cargo

# Configuration files
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias alacrittyconf="$EDITOR ~/.config/alacritty/alacritty.yml"
alias bspwmconf="$EDITOR ~/.config/bspwm/bspwmrc"
alias dunstconf="$EDITOR ~/.config/wal/templates/dunstrc"
alias keysconf="$EDITOR ~/.config/sxhkd/sxhkdrc"
alias lightdmconf="sudo $EDITOR /etc/lightdm/lightdm-webkit2-greeter.conf"
alias lightdmwebkitconf="sudo $EDITOR /usr/share/lightdm-webkit/themes"
alias picomconf="$EDITOR ~/.config/picom/picom.conf"
alias pistolconf="$EDITOR ~/.config/pistol/pistol.conf"
alias polyconf="$EDITOR ~/.config/polybar/config"
alias roficonf="$EDITOR ~/.config/wal/templates/custom-rofi.rasi"
alias vidifyconf="$EDITOR ~/.config/vidify/config.ini"
alias vimconf="cd ~/.config/nvim && $EDITOR && cd -"
alias xprofileconf="$EDITOR ~/.xprofile"
alias zathuraconf="$EDITOR ~/.config/zathura/zathurarc"
alias zshconf="$EDITOR ~/.zshrc"

# Programs
alias android-studio="/opt/android-studio/bin/studio.sh"
alias xampp="sudo /opt/lampp/lampp start"

# Tools for pipes
alias fromclip="xsel --clipboard -o"
alias toclip="xsel --clipboard -i"
alias toixio="curl -F 'f:1=<-' ix.io | tee -a ~/.paste_history"


# ZSH Syntax Highlighting goes at the end
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Theme from wal
sequences=~/.cache/wal/sequences
if [ -f "$sequences" ]; then
    (cat "$sequences" &)
fi
