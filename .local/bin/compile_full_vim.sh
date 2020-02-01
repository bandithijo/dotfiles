#! /bin/bash

# Description:
#   Compile a full-featured Vim from source on Ubuntu/Debian distros. Based
#   entirely on
#   https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
#
# Use:
#   ./compile_full_vim.sh

main(){
	# echo "y" | sudo apt-get remove \
	# 	vim \
	# 	vim-runtime \
	# 	gvim \
	# 	vim-tiny \
	# 	vim-common \
	# 	vim-gui-common
	# echo "y" | sudo apt-get install \
	# 	libncurses5-dev \
	# 	libgnome2-dev \
	# 	libgnomeui-dev \
	# 	libgtk2.0-dev \
	# 	libatk1.0-dev \
	# 	libbonoboui2-dev \
	# 	libcairo2-dev \
	# 	libx11-dev \
	# 	libxpm-dev \
	# 	libxt-dev \
	# 	python-dev ruby-dev \
	# 	mercurial

	# cd ~
	# hg clone https://code.google.com/p/vim/
	# cd vim
	./configure --with-features=huge \
		--enable-multibyte \
		--enable-rubyinterp \
		--enable-pythoninterp \
		--with-python-config-dir=/usr/lib/python2.7/config \
		--enable-perlinterp \
		--enable-luainterp \
		--enable-gui=gtk2 \
		--enable-cscope \
		--prefix=/usr
	# make VIMRUNTIMEDIR=/usr/share/vim/vim74
    make
	sudo make install
}

main
