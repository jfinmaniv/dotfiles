. "$HOME/.bashrc"
[[ ! $TMUX ]] && tmux
[[ ! $(tasklist.exe | grep vcxsrv) ]] && cmd.exe /c config.xlaunch
true
