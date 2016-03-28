#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\[\033[01;34m\][\u\[\033[00m\]@ \h \[\033[01;32m\]\W\[\033[01;34m\]]\[\033[00m\]\$'

# for history
# Disable terminal flow control altogether to use ctrl-s in history searching
stty -ixon

if [ -n $TERM ]; then export LANGUAGE=en_US.UTF-8; fi
export GST_ID3_TAG_ENCODING=GBK:UTF-8:GB18030
export GST_ID3V2_TAG_ENCODING=GBK:UTF-8:GB18030
export EDITOR="vim"
export PYTHONSTARTUP=~/.pythonstartup

export PATH=$PATH:~/bin

# for archlinux
alias vi=vim
alias zzxdgmenu='xdg_menu --format awesome --root-menu /etc/xdg/menus/arch-applications.menu > ~/.config/awesome/menu.lua'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias py='python'
alias py2='python2'
alias py3='python3'
#alias venvpy3.3='. ~/.venv3.3/bin/activate'
alias utserver='cd /mnt/DATA/soft/utorrent-server-v3_0;./utserver'
alias goagent='python2 /mnt/DATA/soft/goagent/local/proxy.py'
alias zzproxy='export http_proxy=127.0.0.1:8118;export https_proxy=127.0.0.1:8118;export ftp_proxy=127.0.0.1:8118'
alias zzproxyoff='export http_proxy=;export https_proxy=;export ftp_proxy='

# 下载网站
# -t重试次数 -Q总大小限制 -l深度可用数字
alias zzgetsite='wget -t 5 -Q 100m -r -E -l inf -k -p -np'
#alias zzgetsite2='wget -r -p -np -k'

alias zzval='valgrind --tool=memcheck --leak-check=full'
alias recordscreen='ffmpeg -f x11grab -s 1366x768 -r 25 -i :0.0 -sameq /tmp/out.mpg'

#alias n7open="mtpfs -o allow_other /media/n7"
#alias n7close="fusermount -u /media/n7"
#
#alias zzandroid='/opt/android-sdk/tools/android'
#alias zzavd='/opt/android-sdk/tools/android avd'

alias zzavm='cd /mnt/DATA/soft/AndroVMplayer-linux64;./run.sh 450 680  120'

alias pyserver='python -m SimpleHTTPServer'
alias pyupload='python ~/bin/SimpleHTTPServerWithUpload.py'

#axel -a -n 9 -s 200000 -o "xx.zip" "http//ss.ss.ss.ss"

#android
export JAVA_HOME=/opt/java6/jdk1.6.0_45
export PATH=$PATH:$JAVA_HOME/bin
export ANDROID_NDK=/mnt/DATA/dev/android-ndk-r9
export PATH=$PATH:$ANDROID_NDK
export ANDROID_SDK=/mnt/DATA/dev/android-studio/sdk
export PATH=$PATH:$ANDROID_SDK/platform-tools:$ANDROID_SDK/tools

