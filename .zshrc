#!/bin/zsh
autoload -Uz colors
colors

if [ -n "$SSH_CONNECTION" ]; then
    export PROMPT=$'%{\e[38;5;111m%}<SSH> %{\e[38;5;47m%}%n%{\e[m%}%{\e[38;5;227m%}@%m%{\e[m%} %{\e[38;5;46m%}[%D]%{\e[m%} %{\e[38;5;202m%}{%*}%{\e[m%} %{\e[38;5;209m%}(%~)%{\e[m%}
%{\e[38;5;45m%}%#%{\e[m%}'
else
    export PROMPT=$'%{\e[38;5;28m%}%n%{\e[m%}%{\e[38;5;142m%}@%m%{\e[m%} %{\e[38;5;38m%}[%D]%{\e[m%} %{\e[38;5;133m%}{%*}%{\e[m%} %{\e[38;5;130m%}(%~)%{\e[m%}
%{\e[38;5;04m%}%#%{\e[m%}'

fi

if [ -e ~/os_info.sh ]; then
    source ~/os_info.sh
fi


#RPROMPT=$'%{\e[38;5;249m%}[%~]%{\e[m%}'
setopt histignorealldups sharehistory


bindkey -e


HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

autoload -Uz compinit
compinit


source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

export PATH=${HOME}/local/bin:$PATH

alias ll='ls -talFh'
alias la='ls -A'
alias emacs='env TERM=screen emacsclient -c -a -nw""'
alias l='ls -CF'
alias sudo='sudo '
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias zshrl='source ~/.zshrc'
alias pd='popd'
alias sdhn='sudo shutdown -h now'
alias chrome='google-chrome --disable-new-avatar-menu'
alias share_dir_mount='sudo mount -t vboxsf vm_share ~/host_share'
alias cal="/usr/bin/cal | grep -C6 --color '`date +' %-d '`'  "
alias ks='echo "は？"' 
alias pip-all-update="pip list --outdated --format=legacy | awk '{print $1}' | xargs sudo  pip install -U"
alias fuck='echo "ふぁっきゅー"'
alias pbcopy='xclip -selection c'
alias count_file='ls -UF | grep -v / | wc -l'


setopt auto_pushd
setopt pushd_ignore_dups

setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt extended_glob
bindkey '^R' history-incremental-pattern-search-backward

export GREP_COLOR="37;45"
export EDITOR="vim"

export PYTHONPATH=/usr/local:$PYTHONPATH
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

export LESS='-iMR'
if [ -e /usr/bin/src-hilite-lesspipe.sh ];then
    export LESSOPEN='| /usr/bin/src-hilite-lesspipe.sh %s'
elif [ -e /usr/share/source-highlight/src-hilite-lesspipe.sh ];then
    export LESSOPEN='| /usr/share/source-highlight/src-hilite-lesspipe.sh %s'
fi

export VISUAL='vim'
stty stop undef
cal.rb
