#!/bin/bash

backup() {
	file=$1
	if [[ -e $file ]] && [[ ! -L $file ]]; then
		mv -iv $file{,.old}
	fi
}

link() {
	ln -sfnv $1 $2
}

# alacritty
backup ~/.alacritty.yml
link $PWD/alacritty.yml ~/.alacritty.yml

# git
backup ~/.gitignore_global
link $PWD/gitignore_global ~/.gitignore_global

# hyper
backup ~/.hyper.js
link $PWD/hyper.js ~/.hyper.js

# emacs
backup ~/.spacemacs.d
link $PWD/spacemacs.d ~/.spacemacs.d

# tmux
backup ~/.tmux.conf
link $PWD/tmux.conf ~/.tmux.conf

# eclipse - vrapper
# backup ~/.vrapperrc
# link $PWD/vrapperrc ~/.vrapperrc

# w3m
# backup ~/.w3m
# mkdir -pv ~/.w3m
# link $PWD/w3m/w3m_config ~/.w3m/config
# link $PWD/w3m/w3m_keymap ~/.w3m/keymap

# xcode - xvim2
# backup ~/.xvimrc
# link $PWD/xvimrc ~/.xvimrc

# vim
backup ~/.vimrc
backup ~/.config/nvim
mkdir -pv ~/.config
link $PWD/nvim ~/.config/nvim
link $PWD/vimrcs/vimrc.vim ~/.vimrc
# mkdir -pv ~/.vim
# link $PWD/vimrcs/templates ~/.vim/templates
# link $PWD/vimrcs/UltiSnips ~/.vim/UltiSnips

# htop
backup ~/.config/htop/htoprc
mkdir -pv ~/.config/htop
link $PWD/htoprc ~/.config/htop/htoprc

# zprezto
backup ~/.zlogin
backup ~/.zlogout
backup ~/.zpreztorc
backup ~/.zprofile
backup ~/.zshenv
backup ~/.zshrc

link $PWD/zprezto/zlogin ~/.zlogin
link $PWD/zprezto/zlogout ~/.zlogout
link $PWD/zprezto/zpreztorc ~/.zpreztorc
link $PWD/zprezto/zprofile ~/.zprofile
link $PWD/zprezto/zshenv ~/.zshenv
link $PWD/zprezto/zshrc ~/.zshrc

backup ~/.fzf_git.zsh
link $PWD/scripts/fzf_git.zsh ~/.fzf_git.zsh

# hammperspoon
# backup ~/.hammerspoon
# link $PWD/hammerspoon ~/.hammerspoon

# bat
backup ~/.config/bat
link $PWD/bat ~/.config/bat

# starship https://starship.rs
backup ~/.config/starship.toml
link $PWD/starship.toml ~/.config/starship.toml

# lf
backup ~/.config/lf/lfrc
backup ~/.config/lf/pv.sh
mkdir -pv ~/.config/lf
link $PWD/lf/lfrc ~/.config/lf/lfrc
link $PWD/lf/pv.sh ~/.config/lf/pv.sh

# kitty
backup ~/.config/kitty/kitty.conf
mkdir -pv ~/.config/kitty
link $PWD/kitty.conf ~/.config/kitty/kitty.conf
