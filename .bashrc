#!/bin/bash

# options
PS1='\n$? \D{%H%M} \W\$ '

# environment variables
# BROWSER=surf-open.sh
BROWSER=/home/jfin/bin/firefox
DISPLAY=:0
EDITOR=vim
LIBGL_ALWAYS_INDIRECT=1 
PATH=~/bin:$PATH
TERM=xterm-256color
today=$(date +'%Y-%m-%d')
export BROWSER DISPLAY EDITOR PATH LIBGL_ALWAYS_INDIRECT TERM today

# aliases
alias autoremove='sudo apt-get autoremove'
alias cdd='cd /mnt/c/Users/jfin/Downloads'
alias cdt='cd /mnt/c/Users/jfin/thesis'
alias cdw='cd /mnt/c/Users/jfin/water-board'
alias cp='cp -r'
alias doas=sudo
alias dot='git --git-dir=$HOME/.dot.git/ --work-tree=$HOME'
alias dota='dot add'
alias dotc='dot commit -m'
alias dotcheck='dot checkout'
alias dotpull='dot pull origin'
alias dotpush='dot push -u origin'
alias dots='dot status'
alias install='sudo apt-get install'
alias l='ls -lF'
alias la='ls -AlF'
alias remove='sudo apt-get remove'
alias rm='trash'
alias search='apt-cache search'
alias update='sudo apt-get update && sudo apt-get upgrade'
alias open='cmd.exe /c start ""'
