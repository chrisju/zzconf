#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
PS1='\[\033[01;34m\][\u\[\033[00m\]@ \h \[\033[01;32m\]\W\[\033[01;34m\]]\[\033[00m\]\$ '

# for history
# Disable terminal flow control altogether to use ctrl-s in history searching
stty -ixon

export EDITOR="vim"

if [ -n $TERM ]; then export LANGUAGE=en_US.UTF-8; fi
export GST_ID3_TAG_ENCODING=GBK:UTF-8:GB18030
export GST_ID3V2_TAG_ENCODING=GBK:UTF-8:GB18030

#history
export HISTSIZE=100000  #最大数目
export HISTFILESIZE=10000000 #最大文件
export PROMPT_COMMAND="history -a"  #实时记录
export HISTCONTROL=ignoreboth:erasedups #去除重复
#export HISTIGNORE="&:ls:ll:la:lp:git st:git push:git diff:git logc:gitg:. *:pwd:cd -:cd ..:zzupblog:man *:fg:py:py3:top"

#golang
export PATH=$PATH:/usr/local/go/bin:/home/zz/script
export GOPATH=/mnt/DATA/proj/p/go

export PYTHONSTARTUP=~/.pythonstartup

##android
#export JAVA_HOME=/opt/java6/jdk1.6.0_45
#export PATH=$PATH:$JAVA_HOME/bin
#export ANDROID_NDK=/mnt/DATA/dev/android-ndk-r9
#export PATH=$PATH:$ANDROID_NDK
#export ANDROID_SDK=/mnt/DATA/dev/android-studio/sdk
#export PATH=$PATH:$ANDROID_SDK/platform-tools:$ANDROID_SDK/tools
#
## for archlinux
#alias vi=vim
#alias zzxdgmenu='xdg_menu --format awesome --root-menu /etc/xdg/menus/arch-applications.menu > ~/.config/awesome/menu.lua'

##alias venvpy3.3='. ~/.venv3.3/bin/activate'
#alias utserver='cd /mnt/DATA/soft/utorrent-server-v3_0;./utserver'
#alias goagent='python2 /mnt/DATA/soft/goagent/local/proxy.py'
#
## 下载网站
## -t重试次数 -Q总大小限制 -l深度可用数字
#alias zzgetsite='wget -t 5 -Q 100m -r -E -l inf -k -p -np'
##alias zzgetsite2='wget -r -p -np -k'
#
#alias zzval='valgrind --tool=memcheck --leak-check=full'
#alias recordscreen='ffmpeg -f x11grab -s 1366x768 -r 25 -i :0.0 -sameq /tmp/out.mpg'
#
##alias n7open="mtpfs -o allow_other /media/n7"
##alias n7close="fusermount -u /media/n7"
##
##alias zzandroid='/opt/android-sdk/tools/android'
##alias zzavd='/opt/android-sdk/tools/android avd'
#
#alias zzavm='cd /mnt/DATA/soft/AndroVMplayer-linux64;./run.sh 450 680  120'
#
##axel -a -n 9 -s 200000 -o "xx.zip" "http//ss.ss.ss.ss"

alias vi='vim'
alias la='ls -A'
alias ll='ls -lh'
alias lp="ls -l |awk '{print \$1 \" \" \$2 \" \" \$3 \" \" \$4 \" \" \$5 \" \" \$6 \" \" \$7 \" \" \$8 \" \" i\$9}' i=`pwd`'/'"
alias less='less -i'
alias bc='bc -l'
alias top='htop'
alias py='python'
alias py2='python2'
alias py3='python3'
alias zzss='sslocal -c /etc/shadowsocks/config-puff.json'
alias zzss2='sslocal -c /etc/shadowsocks/config-vps.json'
alias pyserver='python -m SimpleHTTPServer'
alias pyupload='cd /mnt/DATA/upload;python ~/script/SimpleHTTPServerWithUpload.py'
alias zzcdtm='cd ~/.longene/tm2013/drive_c/Program\ Files/Tencent/tm2013/Users/69791669/FileRecv/'
alias tmrestart='ps aux|grep wine|awk '\''{print $2}'\''|xargs kill -9;nohup /opt/longene/tm2013/tm2013.sh 1>/dev/null 2>1 &'
alias zzupblog='cd /mnt/DATA/proj/p/vimwikiblog/;python3 tools/vimwiki2blog.py -c config/config.json'
#alias zzproxy='export http_proxy=127.0.0.1:8118;export https_proxy=127.0.0.1:8118;export ftp_proxy=127.0.0.1:8118'
#alias zzproxyoff='export http_proxy=;export https_proxy=;export ftp_proxy='
alias zzproxy='export ALL_PROXY=socks5://127.0.0.1:1080'
alias zzproxyoff='export ALL_PROXY='
alias zzcpb2g='cd /mnt/DATA/proj/p;rm -rf ghvimwikiblog/* ;cp -r  vimwikiblog/* ghvimwikiblog/;cd ghvimwikiblog'
alias zzvps='ssh zz@216.189.150.152 -p 2222'
alias todo='grep -rin TODO .'
alias pos='xdotool getmouselocation'
#byzanz-record -d 10 -x 71 -y 328 -w 600 -h 300 my_gif.gif
alias todo='grep -rin "\<todo\>"'

#vsc
alias vsc204='ssh zhuweiwei@192.168.2.204'  #111111
alias zzdownncbi='/mnt/DATA/soft/script/downloadncbi.py'

#FPGA
export CROSS_COMPILE=arm-xilinx-linux-gnueabi-
source /mnt/DATA/soft/Xilinx/Vivado/2015.2/settings64.sh
alias xl-gcc='arm-xilinx-linux-gnueabi-gcc'
alias tclvivado='vivado -mode tcl'

alias fileserver='cd /data/soft/fileserver/ &&  python /data/soft/SimpleHTTPServerWithUpload.py'
