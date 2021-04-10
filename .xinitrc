/home/jfin/scripts/status
sudo modprobe v4l2loopback
source $HOME/.fehbg
numlockx
setxkbmap -option altwin:swap_alt_win 
xrdb -merge .Xresources
xcompmgr &

exec $HOME/scripts/startdwm
