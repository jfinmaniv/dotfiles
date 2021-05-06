# options
set -o emacs
bind ^l=clear-screen
bind -m ^xd="$(date +'%Y-%m-%d')"

# history
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# PS1
export PS1='\n\e[0;31m$(x=$?; (( $x )) && print "$x
")\e[00m\e[1;30m\w\$\e[00m '

# aliases
alias crc='vim ~/.cwmrc; pkill -HUP cwm'
alias altwin='toggle-alt-win'
alias cdd="cd $up/Downloads"
alias cdt='cd "/r/RB3/Shared/TMDL_Wtrshd Assess/"'
alias cdw='cd "/r/RB3/Shared/WQ Control Planning/"'
alias dot='git --git-dir=$HOME/.dot.git/ --work-tree=$HOME'
alias ll='ls -lhF'
alias la='ls -AlhF'
alias owrt='ssh root@192.168.1.1'
alias ranger='. /usr/local/bin/ranger'
alias pdf='sumatra-pdf'
alias rs='rsync -rltuvPh'
alias krc='vim ~/.kshrc; . ~/.kshrc'
alias trc='vim ~/.tmux.conf; tmux source-file ~/.tmux.conf'
alias tp='trash'
alias mnas='doas sshfs root@192.168.1.1:/mnt /mnt/nas -o allow_other'
alias unas='doas umount /mnt/nas'
alias shutdown='doas shutdown -p now'
