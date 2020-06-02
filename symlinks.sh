#!/bin/sh

backup()
{
	file=$1
	if [[ -e $file ]] && [[ ! -L $file ]] ; then
		mv -iv $file{,.old}
	fi
}

# alacritty
backup ~/.alacritty.yml
ln -sfnv $PWD/alacritty.yml ~/.alacritty.yml

# git
backup ~/.gitignore_global
ln -sfnv $PWD/gitignore_global ~/.gitignore_global

# hyper
backup ~/.hyper.js
ln -sfnv $PWD/hyper.js ~/.hyper.js

# emacs
backup ~/.spacemacs.d
ln -sfnv $PWD/spacemacs.d ~/.spacemacs.d

# tmux
backup ~/.tmux.conf
ln -sfnv $PWD/tmux.conf ~/.tmux.conf

# eclipse - vrapper
backup ~/.vrapperrc
ln -sfnv $PWD/vrapperrc ~/.vrapperrc

# w3m
backup ~/.w3m
mkdir -pv ~/.w3m
ln -sfnv $PWD/w3m/w3m_config ~/.w3m/config
ln -sfnv $PWD/w3m/w3m_keymap ~/.w3m/keymap

# xcode - xvim2
backup ~/.xvimrc
ln -sfnv $PWD/xvimrc ~/.xvimrc

# vim
backup ~/.vimrc
backup ~/.config/nvim

mkdir -pv ~/.config
ln -sfnv $PWD/vimrcs/config_nvim ~/.config/nvim
ln -sfnv $PWD/vimrcs/vimrc.vim ~/.vimrc

# htop
backup ~/.config/htop/htoprc
ln -sfnv $PWD/htoprc ~/.config/htop/htoprc

# zprezto
backup ~/.zlogin
backup ~/.zlogout
backup ~/.zpreztorc
backup ~/.zprofile
backup ~/.zshenv
backup ~/.zshrc

ln -sfnv $PWD/zprezto/zlogin ~/.zlogin
ln -sfnv $PWD/zprezto/zlogout ~/.zlogout
ln -sfnv $PWD/zprezto/zpreztorc ~/.zpreztorc
ln -sfnv $PWD/zprezto/zprofile ~/.zprofile
ln -sfnv $PWD/zprezto/zshenv ~/.zshenv
ln -sfnv $PWD/zprezto/zshrc ~/.zshrc

backup ~/.fzf_git.zsh
ln -sfnv $PWD/scripts/fzf_git.zsh ~/.fzf_git.zsh

# hammperspoon
backup ~/.hammerspoon
ln -sfnv $PWD/hammerspoon ~/.hammerspoon


