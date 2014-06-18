#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias clang++='clang++ -std=c++11'

PS1="[\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]]-> "

export PATH="$PATH:$HOME/bin:$HOME/.gem/ruby/2.1.0/bin"
