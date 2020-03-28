#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "$TMUX" ]; then

    tmux attach -t 0 || tmux new -s 0

fi
