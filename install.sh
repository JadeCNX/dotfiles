#!/bin/bash

backup() {
	file=$1
	if [[ -e $file ]] && [[ ! -L $file ]]; then
		mv -iv "$file"{,.old}
	fi
}

link() {
  source=$1
  destination=$2
  backup "$destination"
  mkdir -p "$(dirname "$destination")"
	ln -sfnv "$source" "$destination"
}

# alacritty
link "$PWD"/alacritty.yml ~/.alacritty.yml

# git
link "$PWD"/gitignore_global ~/.gitignore_global

# hyper
link "$PWD"/hyper.js ~/.hyper.js

# emacs
link "$PWD"/spacemacs.d/init.el ~/.spacemacs.d/init.el

# tmux
link "$PWD"/tmux.conf ~/.tmux.conf

# vim
link "$PWD"/vimrcs/vimrc.vim ~/.vimrc

# nvim
link "$PWD"/nvim/init.vim ~/.config/nvim/init.vim
link "$PWD"/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

# lvim
link "$PWD"/lvim/config.lua ~/.config/lvim/config.lua

# htop
link "$PWD"/htoprc ~/.config/htop/htoprc

# zprezto
link "$PWD"/zprezto/zlogin ~/.zlogin
link "$PWD"/zprezto/zlogout ~/.zlogout
link "$PWD"/zprezto/zpreztorc ~/.zpreztorc
link "$PWD"/zprezto/zprofile ~/.zprofile
link "$PWD"/zprezto/zshenv ~/.zshenv
link "$PWD"/zprezto/zshrc ~/.zshrc
link "$PWD"/scripts/fzf_git.zsh ~/.fzf_git.zsh

# bat
link "$PWD"/bat/config ~/.config/bat/config

# starship https://starship.rs
link "$PWD"/starship.toml ~/.config/starship.toml

# lf
link "$PWD"/lf/lfrc ~/.config/lf/lfrc
link "$PWD"/lf/pv.sh ~/.config/lf/pv.sh

# kitty
link "$PWD"/kitty.conf ~/.config/kitty/kitty.conf

# mpv
link "$PWD"/mpv/mpv.conf ~/.config/mpv/mpv.conf
link "$PWD"/mpv/input.conf ~/.config/mpv/input.conf
