#!/usr/bin/sh

cp /etc/hosts conf/
cp /etc/fstab conf/
cp /etc/pacman.d/mirrorlist conf/
cp ~/.bashrc conf/
cp ~/.gitconfig ~/.gitignore conf/
cp ~/.vimrc conf/
cp ~/.Xdefaults conf/
cp ~/.xinitrc conf/
git st


# vim
echo
cd ~/.vim
pwd
git st
#git ci -m"backup"
#git push origin master
cd - > /dev/null

# awesome
echo
cd ~/.config/awesome/
pwd
git st
#git ci -m"backup"
#git push origin master
cd - > /dev/null
