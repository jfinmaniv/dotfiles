# options
set -o emacs
bind ^l=clear-screen
bind -m ^xd="$(date +'%Y-%m-%d')"

# history
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# PS1
export PS1='\e[01;31m$(x=$?; (( $x )) && printf "error $x\\\\n")\e[00m
\e[01;30m$PWD\e[00m
\e[01;30m\$ \e[00m'

# aliases
alias bak='backup-file'
alias crc='vim ~/.cwmrc; pkill -HUP cwm'
alias dot='git --git-dir=$HOME/.dot.git/ --work-tree=$HOME'
alias dott='add-push-commit-dot'
alias etc='git --git-dir=/etc/.etc.git/ --work-tree=/etc'
alias etcc='add-push-commit-etc'
alias fd='find . -name'
alias gitt='add-push-commit'
alias kb='show-key-bindings'
alias krc='vim ~/.kshrc; . ~/.kshrc'
alias l1='ls -1'
alias lA='ls -AlhFd .*'
alias la='ls -AlhF'
alias ll='ls -lhF'
alias lynx="lynx -cfg=$HOME/lynx/lynx.cfg -lss=$HOME/lynx/lynx.lss"
alias mnas='doas sshfs root@192.168.1.1:/mnt /mnt/nas -o allow_other'
alias mvv='batch-rename'
alias pdf='sumatra-pdf'
alias pdff='markdown-to-pdf'
alias play='mpv'
alias ranger='. /usr/local/bin/ranger'
alias reboot='doas reboot'
alias rename='batch-rename'
alias shutdown='doas halt -p'
alias sshr='ssh root@192.168.1.1'
alias tp='move-to-trash'
alias trc='vim ~/.tmux.conf; tmux source-file ~/.tmux.conf'
alias ubak='restore-file'
alias unas='doas umount /mnt/nas'

