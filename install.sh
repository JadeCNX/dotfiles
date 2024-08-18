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
    return
  fi
  echo "SET: $config - $destination"
  backup "$destination"
  mkdir -p "$(dirname "$destination")"
  ln -sfn "$source" "$destination"
}

copy() {
  config=$1
  source=$2
  destination=$3
  if [[ -n "$specific_config" ]] && [[ "$specific_config" != "$config" ]]; then
    return
  fi
  echo "SET: $config - $destination"
  rsync -azv "$source" "$destination"
}

# alacritty
link alacritty "$PWD/alacritty/themes" "$HOME/.config/alacritty/themes"
link alacritty "$PWD/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"

# git
link git "$PWD/gitignore_global" "$HOME/.gitignore_global"

# hyper
link hyper "$PWD/hyper.json" "$HOME/.config/Hyper/hyper.json"

# emacs
link emacs "$PWD/spacemacs.d/init.el" "$HOME/.spacemacs.d/init.el"

# tmux
link tmux "$PWD/tmux/tmux.conf" "$HOME/.tmux.conf"
link tmux "$PWD/tmux/themes/light.conf" "$HOME/.tmux/themes/light.conf"
link tmux "$PWD/tmux/themes/dark.conf" "$HOME/.tmux/themes/dark.conf"
link tmux "$PWD/tmux/themes/toggle-themes.sh" "$HOME/.tmux/themes/toggle-themes.sh"

# vim
link vim "$PWD/vimrcs/vimrc.vim" "$HOME/.vimrc"

# htop
link htop "$PWD/htoprc" "$HOME/.config/htop/htoprc"

# zprezto
link zprezto "$PWD/zprezto/zlogin" "$HOME/.zlogin"
link zprezto "$PWD/zprezto/zlogout" "$HOME/.zlogout"
link zprezto "$PWD/zprezto/zpreztorc" "$HOME/.zpreztorc"
link zprezto "$PWD/zprezto/zprofile" "$HOME/.zprofile"
link zprezto "$PWD/zprezto/zshenv" "$HOME/.zshenv"
link zprezto "$PWD/zprezto/zshrc" "$HOME/.zshrc"
link zprezto "$PWD/scripts/fzf_git.zsh" "$HOME/.fzf_git.zsh"

# bat
link bat "$PWD/bat/config" "$HOME/.config/bat/config"

# starship https://starship.rs
link starship  "$PWD/starship.toml" "$HOME/.config/starship.toml"

# lf
link lf "$PWD/lf/lfrc" "$HOME/.config/lf/lfrc"
link lf "$PWD/lf/preview" "$HOME/.config/lf/preview"
link lf "$PWD/lf/cleaner" "$HOME/.config/lf/cleaner"
link lf "$PWD/lf/lfrun" "$HOME/.local/bin/lfrun"

# kitty
link kitty "$PWD/kitty.conf" "$HOME/.config/kitty/kitty.conf"

# mpv
link mpv "$PWD/mpv/mpv.conf" "$HOME/.config/mpv/mpv.conf"
link mpv "$PWD/mpv/input.conf" "$HOME/.config/mpv/input.conf"

# fish
link fish "$PWD/fish/config.fish" "$HOME/.config/fish/config.fish"
link fish "$PWD/fish/fish_plugins" "$HOME/.config/fish/fish_plugins"

# ideavimrc
link ideavim "$PWD/ideavimrc" "$HOME/.ideavimrc"

# vrapper
link vrapper "$PWD/vrapperrc" "$HOME/.vrapperrc"

# zellij
link zellij "$PWD/zellij/config.kdl" "$HOME/.config/zellij/config.kdl"

# wezterm
link wezterm "$PWD/wezterm.lua" "$HOME/.wezterm.lua"
