if [[ -z "$DISPLAY" ]]
then
    startxwin -- > /dev/null 2>&1 &
    export DISPLAY=:0
fi

# environment 
BROWSER=/home/jfin/scripts/firefox
CHERE_INVOKING=1
d=$(date +'%Y-%m-%d')
EDITOR=vim
PATH=$HOME/bin:$HOME/scripts:$PATH
TERM=xterm-256color
FZF_DEFAULT_COMMAND='$HOME/.fd/fd.exe --type f'

export BROWSER CHERE_INVOKING d EDITOR FZF_DEFAULT_COMMAND PATH TERM


# PS1='\n$? \D{%H%M} \W\$ '

# aliases
alias cdp='. $HOME/scripts/cygpath-cd'
alias cs='cygstart.exe'
alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dott='dot add .; dot commit -m "edits"; dot push'
alias gitt='git add .; git commit -m "edits"; git push'
alias l='ls -lhF'
alias la='ls -AlhF'
alias open='cmd.exe /c start ""'
alias owrt='ssh root@192.168.1.1'
alias ranger='source /usr/bin/ranger'
alias rs='rsync -rltuvPh'

if [[ -z "$TMUX" ]]
then
    tmux
fi

# echo "Everything is becoming."
