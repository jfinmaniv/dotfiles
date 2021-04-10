if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  sudo /home/jfin/scripts/wakeup-disable
  exec startx
fi
