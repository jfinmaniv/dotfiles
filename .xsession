#!/bin/sh

# path
export PATH=".:$HOME/scripts:$PATH"

# other variables
export EDITOR=/usr/local/bin/vim
export TERM=xterm-256color
export ENV=$HOME/.kshrc
export LC_CTYPE="en_US.UTF-8"

# firefox
export MOZ_ACCELERATED=1
export MOZ_WEBRENDER=1

# fonts
for font in /usr/local/share/fonts/*
do
	xset +fp $font
done

# x utilities
xrdb .Xresources
numlockx
unclutter -root -noevents &
xmodmap .xmodmaprc

# should be in /etc/sysctl.conf
doas sysctl machdep.lidaction=0

# doas ntfs-3g /dev/sd2i /mnt/shared

# status bar
# status-print | lemonbar-xft -p -n status -f "Terminus:size=16" &
# status-watch &

cwm
