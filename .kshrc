# path
scripts="$HOME/scripts"
tex="/opt/texlive/2021/bin/win32"
firefox="/opt/firefox/firefox.exe"
sumatra="/opt/sumatra-pdf"
export PATH=".:$scripts:$firefox:$sumatra:$tex:$PATH"

# other variables
export BROWSER='/opt/firefox/firefox.exe'
export CHERE_INVOKING=1 
export EDITOR=/usr/bin/vim
export TERM=xterm-256color
export MOZ_ACCELERATED=1


# options
set -o emacs
bind ^l=clear-screen
bind -m ^xd="$(date +'%Y-%m-%d')"

# history
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# PS1
export PS1='\n\e[31m$(x=$?; (( $x )) && print "$x ")\e[00m\e[37m\w\$\e[00m '

# aliases
alias cdd="cd $up/Downloads"
alias cdt='cd "/r/RB3/Shared/TMDL_Wtrshd Assess/"'
alias cdw='cd "/r/RB3/Shared/WQ Control Planning/"'
alias dot='git --git-dir=$HOME/.dot.git/ --work-tree=$HOME'
alias ll='ls -lhF'
alias la='ls -AlhF'
alias owrt='ssh root@192.168.1.1'
alias ranger='source /usr/bin/ranger'
alias pdf='sumatra-pdf'
alias rs='rsync -rltuvPh'
alias krc='vim ~/.kshrc; . ~/.kshrc'
alias trc='vim ~/.tmux.conf; tmux source-file ~/.tmux.conf'
alias tp='trash'
