#!/bin/bash

specific_config=$1
if [[ -n "$specific_config" ]]; then
  echo "specific config: $specific_config"
fi

backup() {
	file=$1
	if [[ -e $file ]] && [[ ! -L $file ]]; then
		mv -iv "$file"{,.old}
	fi
}

link() {
  config=$1
  source=$2
  destination=$3
  if [[ -n "$specific_config" ]] && [[ "$specific_config" != "$config" ]]; then
    echo "SKIP: $config"
    return
  fi
  echo "SET: $config - $destination"
  backup "$destination"
  mkdir -p "$(dirname "$destination")"
  ln -sfn "$source" "$destination"
}

# alacritty
link alacritty "$PWD"/alacritty.yml ~/.alacritty.yml

# git
link git "$PWD"/gitignore_global ~/.gitignore_global

# hyper
link hyper "$PWD"/hyper.js ~/.hyper.js

# emacs
link emacs "$PWD"/spacemacs.d/init.el ~/.spacemacs.d/init.el

# tmux
link tmux "$PWD"/tmux.conf ~/.tmux.conf

# vim
link vim "$PWD"/vimrcs/vimrc.vim ~/.vimrc

# nvim
link nvim "$PWD"/nvim/init.vim ~/.config/nvim/init.vim
link nvim "$PWD"/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

# lvim
link lvim "$PWD"/lvim/config.lua ~/.config/lvim/config.lua

# htop
link htop "$PWD"/htoprc ~/.config/htop/htoprc

# zprezto
link zprezto "$PWD"/zprezto/zlogin ~/.zlogin
link zprezto "$PWD"/zprezto/zlogout ~/.zlogout
link zprezto "$PWD"/zprezto/zpreztorc ~/.zpreztorc
link zprezto "$PWD"/zprezto/zprofile ~/.zprofile
link zprezto "$PWD"/zprezto/zshenv ~/.zshenv
link zprezto "$PWD"/zprezto/zshrc ~/.zshrc
link zprezto "$PWD"/scripts/fzf_git.zsh ~/.fzf_git.zsh

# bat
link bat "$PWD"/bat/config ~/.config/bat/config

# starship https://starship.rs
link starship  "$PWD"/starship.toml ~/.config/starship.toml

# lf
link lf "$PWD"/lf/lfrc ~/.config/lf/lfrc
link lf "$PWD"/lf/pv.sh ~/.config/lf/pv.sh

# kitty
link kitty "$PWD"/kitty.conf ~/.config/kitty/kitty.conf

# mpv
link mpv "$PWD"/mpv/mpv.conf ~/.config/mpv/mpv.conf
link mpv "$PWD"/mpv/input.conf ~/.config/mpv/input.conf

# fish
link fish "$PWD"/fish/config.fish ~/.config/fish/config.fish
link fish "$PWD"/fish/fish_plugins ~/.config/fish/fish_plugins
