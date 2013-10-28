#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# for history
# Disable terminal flow control altogether to use ctrl-s in history searching
stty -ixon

# 追加模式记录history
shopt -s histappend
# 清除重复命令
# HISTCONTROL=erasedups
# 忽略重复的命令
export HISTCONTROL=ignoredups
# 忽略由冒号分割的这些命令开头的命令
export HISTIGNORE="[ \t]*:bg:fg:exit:history"
# 设置保存历史命令的文件大小
export HISTFILESIZE=1000000
# 保存历史命令条数
export HISTSIZE=10000

if [ -n $TERM ]; then export LANGUAGE=en_US.UTF-8; fi
export GST_ID3_TAG_ENCODING=GBK:UTF-8:GB18030
export GST_ID3V2_TAG_ENCODING=GBK:UTF-8:GB18030
export EDITOR="vim"
export PYTHONSTARTUP=~/.pythonstartup

export PATH=$PATH:/home/zz/bin

# for archlinux
alias vi=vim
alias ll='ls -l'
alias zzxdgmenu='xdg_menu --format awesome --root-menu /etc/xdg/menus/arch-applications.menu > ~/.config/awesome/menu.lua'

alias py='python'
alias py2='python2'
alias py3='python3'
alias utserver='cd /mnt/DATA/soft/utorrent-server-v3_0;./utserver'
alias goagent='python2 /mnt/DATA/soft/goagent/local/proxy.py'
alias zzproxy='export http_proxy=127.0.0.1:8087;export ftp_proxy=127.0.0.1:8087'
alias zzproxyoff='export http_proxy=;export ftp_proxy='

# 下载网站
# -t重试次数 -Q总大小限制 -l深度可用数字
alias zzgetsite='wget -t 5 -Q 100m -r -E -l inf -k -p -np'
#alias zzgetsite2='wget -r -p -np -k'

alias zzval='valgrind --tool=memcheck --leak-check=full'

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

