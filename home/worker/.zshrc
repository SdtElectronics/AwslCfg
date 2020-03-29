# Created by newuser for 5.7.1
ZSH_THEME="agnoster"

plugins=(zsh-autosuggestions)

# key bindings
bindkey '\e[1~' beginning-of-line

bindkey '\e[4~' end-of-line

bindkey "\e[3~" delete-char

#completion
setopt complete_in_word

setopt AUTO_LIST
setopt AUTO_MENU

autoload -U compinit
compinit

zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*:*:default' force-list always
zstyle ':completion:*' select-prompt '%SSelect: lines: %L matches: %M   [%p]'

zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix   _match _approximate

eval $(dircolors -b)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-  9]#)*=0=01;31'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
zstyle ':completion:*:corrections' format $'\e[01;32m -- %d (errors: %e) --\e[0m'

powerline-daemon -q

. /usr/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh

cd ~

export DISPLAY=:0

PATH=$PATH:~/bin

alias ls=ls\ -F\ --color
alias degfw=export\ ALL_PROXY=socks5://127.0.0.1:1080
alias gfw=unset\ ALL_PROXY
alias sudoedit=EDITOR=vim\ sudoedit
alias gitp=git\ push\ -u\ origin\ master
alias sugitp=sudo\ git\ push\ -u\ origin\ master
alias gitr=git\ rm\ -r\ --cached

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
	exec tmux
fi

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
