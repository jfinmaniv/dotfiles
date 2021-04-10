BROWSER=/usr/bin/firefox
_JAVA_AWT_WM_NONREPARENTING=1
PATH=$HOME/scripts:$PATH
export BROWSER PATH _JAVA_AWT_WM_NONREPARENTING

# prompt
# http://bewatermyfriend.org/p/2013/003/ 
# function virtual_env_prompt () {
#     REPLY=${VIRTUAL_ENV+(${VIRTUAL_ENV:t})}
# }
# grml_theme_add_token virtual-env -f virtual_env_prompt '%F{magenta}' '%f'
# zstyle ':prompt:grml:left:setup' items newline rc virtual-env change-root path vcs percent

PROMPT=$'\n%F{red}%(?..%? )%f%B%F{black}%/\n>%f%b '

alias zrc='vim ~/.zshrc; . ~/.zshrc'

alias cans='sudo bluetoothctl connect 70:26:05:CF:75:A1'
alias cants='sudo bluetoothctl disconnect 70:26:05:CF:75:A1'
alias cdn='cd /media/share'
alias cds='cd /media/storage'
alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dott='dot add .; dot commit -m "edits"; dot push'
alias gitt='git add .; git commit -m "edits"; git push'
alias du='sudo du -d1 -h'
alias install='sudo pacman -S'
alias iwd='sudo systemctl restart iwd.service && status'
alias ll='ls -lh'
alias la='ls -lha'
alias mmem='sudo mount -o uid=1001,gid=1001 /dev/disk/by-id/mmc-SM16G_0xb36600c8-part1 /media/memcard'
alias mshare='sudo mount -o soft 192.168.1.1:/mnt/jfin /media/share'
alias mphone='sudo ifuse -o allow_other /media/phone'
alias mpv='mpv --audio-display=no'
alias mthumb='sudo mount -o uid=1000,gid=1000 /dev/disk/by-label/THUMB /media/thumb'
alias owrt='ssh root@192.168.1.1'
alias tp='trash'
alias umem='sudo umount /media/memcard'
alias ushare='sudo umount /media/share'
alias uphone='sudo umount /media/phone'
alias uthumb='sudo umount /media/thumb'
alias zrc='vim ~/.zshrc; . ~/.zshrc'
alias zzz='systemctl suspend'
alias ZZZ='sudo shutdown now'

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# pacman
# alias update='sudo pacman -Syu && sudo paccache -rk1'
# alias search='sudo pacman -Ss'
# alias remove='sudo pacman -Rs'
# alias orphans='sudo pacman -Rns $(pacman -Qtdq)'
# alias install='sudo pacman -S'
# alias clean='sudo paccache -rk1'
