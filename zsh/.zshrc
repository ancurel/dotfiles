
# General Options
# ---------------

# reclaim ctrl-s &ctrl-q keys
stty -ixon -ixoff

[[ -e "$HOME/.config/dir_colors" ]] && eval $(dircolors -b "$HOME/.config/dir_colors")

EDITOR='vim'
export NODE_PATH=$HOME/.local/node_modules:/usr/lib/node_modules
export PATH=$HOME/.local/node_modules/bin:$HOME/.local/bin:$HOME/scripts/:$PATH

# bspwm/fifo
export PANEL_FIFO=/tmp/panel-fifo

# wayland/wlc stuff
export WLC_DRM_DEVICE=card1
export WLC_REPEAT_DELAY=425
export WLC_REPEAT_RATE=25

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
alias lessc="~/node_modules/.bin/lessc"
alias opti="ssh optimus.local"
alias dmenu_run="dmenu_run -i -fn '-*-tewi-medium-*-*-*-*-*-*-*-*-*-*-*' \
    -dim .4 -l 4 -w 400 -x 30 -y 40 -o .9 -q -p '>' \
    -sb #25D4E2 -sf #000 -h 20"

if [ $commands[nvim] ]; then
    EDITOR='nvim'
    alias vim='nvim'
fi

pdfmerge () {
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default -dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -r150 -sOutputFile=$@
}



# Virtual envwrapper
# -----------------
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/virtualenvs
    export PROJECT_HOME=$HOME/repos
    export VIRTUAL_ENV_DISABLE_PROMPT=1
    source /usr/bin/virtualenvwrapper.sh
fi



# Fasd / Autojump
# --------
if [ $commands[fasd] ]; then
    eval "$(fasd --init posix-alias zsh-hook zsh-ccomp)"
    alias j='fasd_cd -d'
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
