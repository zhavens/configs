#! /bin/bash

for f in $(ls -a | egrep "^\.\w+"); do
    cp $f ~/
done

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim --clean '+source ~/.vimrc' +PluginInstall +qall
