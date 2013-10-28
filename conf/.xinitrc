#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

export LANG=zh_CN.UTF-8
export LC_ALL="zh_CN.UTF-8"

wicd-client &
fcitx &

exec dbus-launch awesome
# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
