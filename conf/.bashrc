# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='\[\033[01;34m\][\u\[\033[00m\]@ \h \[\033[01;32m\]\W\[\033[01;34m\]]\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# for history
# Disable terminal flow control altogether to use ctrl-s in history searching
stty -ixon

export EDITOR="vim"

if [ -n "$TERM" ]; then export LANGUAGE=en_US.UTF-8; fi
export GST_ID3_TAG_ENCODING=GBK:UTF-8:GB18030
export GST_ID3V2_TAG_ENCODING=GBK:UTF-8:GB18030

#history
HISTSIZE=9999999  #最大数目
HISTFILESIZE=10000000 #最大文件
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"  #实时记录
HISTCONTROL=ignoreboth:erasedups #去除重复
#HISTIGNORE="&:ls:ll:la:lp:git st:git push:git diff:git logc:gitg:. *:pwd:cd -:cd ..:zzupblog:man *:fg:py:py3:top"

#golang
export PATH=$PATH:/usr/local/go/bin:/home/zz/bin:/home/zz/script
export GOPATH=/mnt/DATA/proj/p/go

export PYTHONSTARTUP=~/.pythonstartup

##android
export JAVA_HOME=/opt/android-studio/jbr
export PATH=$JAVA_HOME/bin:$PATH
export ANDROID_NDK=/home/zz/Android/SDK/ndk/29.0.13113456
export PATH=$ANDROID_NDK:$PATH
export NDK=$ANDROID_NDK
export ANDROID_SDK=/home/zz/Android/SDK
export PATH=$ANDROID_SDK/platform-tools:$ANDROID_SDK/tools:$PATH
export ANDROID_CMAKE_BIN=/home/zz/Android/SDK/cmake/3.6.4111459/bin/
alias gradle='./gradlew'

export ANDROID_HOME=$ANDROID_SDK
export ANDROID_NDK_HOME=$ANDROID_NDK

#alias logcatxvisio="adb shell ps|grep -i xvisio|awk '{print \$2}'|xargs -I {} adb logcat --pid={}"
#alias logcat="xargs -I {} adb shell grep -i {}|awk '{print \$2}'|xargs -I {} adb logcat --pid={}"
#alias androidstartsettings="adb shell am start -n com.android.settings/com.android.settings.Settings"
#alias dmake="cmake -DCMAKE_BUILD_TYPE=Debug"

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
alias zzgetsite='wget -t 5 -Q 100m -r -E -l inf -k -p -np'
#alias zzgetsite2='wget -r -p -np -k'
#
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
alias top2='htop -d 30'
alias py2='python2'
alias py3='python3'
if ! command -v python &>/dev/null; then
  alias python='python3'
fi
alias py='python'
alias zzduall='du -s * .[!.]* | sort -nr '
alias zzdu='du -s * .[!.]* | sort -nr | head -n 15'

alias zzinxi='inxi -Fxz'
alias zzsync='rsyanc -avzPh'

alias zzval='valgrind --tool=memcheck --leak-check=full'
#alias zzss='sslocal -c /etc/shadowsocks/config-puff.json'
#alias zzss2='sslocal -c /etc/shadowsocks/config-vps.json'
#alias zzcdtm='cd ~/.longene/tm2013/drive_c/Program\ Files/Tencent/tm2013/Users/69791669/FileRecv/'
#alias tmrestart='ps aux|grep wine|awk '\''{print $2}'\''|xargs kill -9;nohup /opt/longene/tm2013/tm2013.sh 1>/dev/null 2>1 &'
#alias zzcpb2g='cd /mnt/DATA/proj/p;rm -rf ghvimwikiblog/* ;cp -r  vimwikiblog/* ghvimwikiblog/;cd ghvimwikiblog'
#alias zzupblog='cd /mnt/DATA/proj/p/vimwikiblog/;python3 tools/vimwiki2blog.py -c config/config.json'
#alias zzproxy='export http_proxy=127.0.0.1:8118;export https_proxy=127.0.0.1:8118;export ftp_proxy=127.0.0.1:8118'
#alias zzproxyoff='export http_proxy=;export https_proxy=;export ftp_proxy='
alias zzproxy='export ALL_PROXY=socks5://127.0.0.1:1080'
alias zzproxyoff='export ALL_PROXY='
alias pos='xdotool getmouselocation'
#byzanz-record -d 10 -x 71 -y 328 -w 600 -h 300 my_gif.gif
alias todo='grep -rin "\<todo\>"'
alias cd..='cd ..'
alias pymk='python setup.py sdist bdist_wheel'
alias pymk='python -m build'
alias pyup='twine upload dist/*'

#alias fileserver='cd /data/soft/fileserver/ &&  python /data/soft/SimpleHTTPServerWithUpload.py'
alias zzdockerclear='docker rm $(docker ps -a -q)'
alias zzrdpnb='xfreerdp /u:"xvisio" /v:192.168.1.200:3389'

#alias zzxfcerecover='cp ~/desktopbackup/xfce4-panel-2.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml'
#alias zzxfcerestart='xfce4-panel --quit ; pkill xfconfd ; nohup xfce4-panel &'
#alias zzfix='zzxfcerecover;zzxfcerestart'


alias gitrename='git commit --amend --author="chrisju <mchrisju@gmail.com>" --no-edit && git rebase --continue'
alias cdme='cd /home/r/proj/zz'
alias cd..='cd ..'
alias pymk='python setup.py sdist bdist_wheel'
#alias vi='nvim'
export MYNAME=朱偉偉

export PATH=$PATH:/home/r/proj/zz/soft/pypy3.11-v7.3.19-linux64/bin
export PATH=$PATH:/home/r/proj/zz/script
export GOPATH=/home/r/proj/zz/go
export PATH=$PATH:$GOPATH/bin


