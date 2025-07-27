
# General Options
# ---------------

# reclaim ctrl-s &ctrl-q keys
stty -ixon -ixoff

[[ -e "$HOME/.config/dir_colors" ]] && eval $(dircolors -b "$HOME/.config/dir_colors")

# Editor 
EDITOR='vim'
# Envar used in https://github.com/yyx990803/launch-editor used in many nodejs devtools
LAUNCH_EDITOR=nvim-rpc-command

export PATH=$PATH:$HOME/.local/bin:$HOME/scripts/
# Node
# export NODE_PATH=$HOME/.local/node_modules:/usr/lib/node_modules
export PATH=$PATH:$HOME/.local/node_modules/bin:./node_modules/.bin
# rust
export PATH=$PATH:$HOME/.cargo:$HOME/.cargo/bin
# Drupal/php
export PATH=$PATH:./vendor/bin
# pnpm
export PNPM_HOME=$HOME/.local/share/pnpm
export PATH=$PATH:$PNPM_HOME
# pnpm end

# set truecolor
if [[ "${TERM}" == "st-256color" ]]; then
    export COLORTERM="24bit"
fi

# export MOZ_DISABLE_RDD_SANDBOX=1

# bspwm/fifo
export PANEL_FIFO=/tmp/panel-fifo

# wayland/wlc stuff
export WLC_DRM_DEVICE=card1
export WLC_REPEAT_DELAY=425
export WLC_REPEAT_RATE=25

# Change config dir for gnupg
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg

#skim
export SKIM_DEFAULT_COMMAND="fd --type f || git ls-tree -r --name-only HEAD || rg --files || find ."

# node
export NPM_CHECK_INSTALLER="pnpm"

# android
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Source all files in ~/.zsh/
for config_file ($HOME/.zsh/*.zsh); do
    source $config_file
done

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U colors && colors
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zshistory"
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS



# Directory / Files
# -----------------
alias ls="ls --color=auto"
alias lsl="ls -lh"
alias lsa="ls -alh"
alias lsd="ls -alh --group-directories-first"
alias up="dirup"
alias o="xdg-open"

alias fmodall="cmodall f"
alias dmodall="cmodall d"

cmodall() {
    find . -type $1 -exec chmod $2 {} \;
}

dirup() {
    if [ $1 ]; then
        x=1
        while [ $x -le $1 ]
        do
            up=$up"../"
            x=$(( $x + 1 ))
        done
        cd $up
        unset x up
    else
        cd ..
    fi
}



# Tmux
# ----
alias tm="tmux -2"
alias ta="tm attach -t"
alias ts="tm new-session -s"
alias tl="tmux list-sessions"



# Rrsync
# ------
alias rs-copy="rsync -avr --progress -h"
alias rs-move="rsync -avr --progress -h --remove-source-files"
alias rs-copy-gi="rsync -avr --progress -h --delete --filter=':- .gitignore'"
alias rs-copy-ngi="rsync -avr --progress -h --delete --delete-excluded --filter=':- .gitignore' --exclude .git/"



# Tar aliases
# -----------
alias tarzip='unzip'
alias tarx='tar -xvf'
alias targz='tar -zxvf'
alias tarbz2='tar -jxvf'



# Various aliases
# ---------------
alias vpn="sudo vpn"
alias wchat="screen -S irc weechat-curses"
alias dmenu_run="dmenu_run -i -fn '-*-tewi-medium-*-*-*-*-*-*-*-*-*-*-*' \
    -dim .4 -l 4 -w 400 -x 30 -y 40 -o .9 -q -p '>' \
    -sb #25D4E2 -sf #000 -h 20"

if [ $commands[nvim] ]; then
    EDITOR='nvim'
    alias vim='nvim'
    alias vimdiff='nvim -d'
fi

if [ $commands[atuin] ]; then
    eval "$(atuin init zsh --disable-up-arrow)"
elif [ $commands[mcfly] ]; then
    export MCFLY_FUZZY=2
    export MCFLY_KEY_SCHEME=vim
    eval "$(mcfly init zsh)"
fi


pdfmerge () {
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default -dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -r150 -sOutputFile=$@
}




# Autojump
# --------
if [ $commands[zoxide] ]; then
    eval "$(zoxide init zsh)"
    alias j="__zoxide_z"
    alias ji="__zoxide_zi"
elif [ $commands[autojump] ]; then
    # Gentoo
    if [ -f /etc/profile.d/autojump.sh ]; then
        . /etc/profile.d/autojump.sh
    # Debian
    elif [ -f /usr/share/autojump/autojump.sh ]; then
        . /usr/share/autojump/autojump.sh
    fi
fi



# Phone notifications
# -------------------
alias mnotify="pushoverSend"

pushoverSend() {
    curl -s \
        -F token=$PUSH_TOKEN \
        -F user=$PUSH_USER \
        -F message="$*" \
        https://api.pushover.net/1/messages.json
}

