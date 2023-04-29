#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vim='nvim'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

export PATH="$PATH:[PATH_OF_FLUTTER_GIT_DIRECTORY]/bin"
export PNPM_HOME="/home/oacs/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} ]]
then
	exec fish
fi

