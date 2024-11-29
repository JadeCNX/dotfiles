#!/bin/sh

dark_mode="$1"

alacritty_theme_file="$HOME/.config/alacritty/theme.toml"

if [ "$dark_mode" = "dark" ]; then
  tmux set -g @catppuccin_flavor 'mocha'
  tmux set -g @rose_pine_variant 'moon'

  ln -fs "$HOME/.config/alacritty/themes/catppuccin_mocha.toml" "$alacritty_theme_file"
  /opt/homebrew/bin/tmux run-shell "$HOME/.tmux/plugins/tmux/catppuccin.tmux"
else
  tmux set -g @catppuccin_flavor 'latte'
  tmux set -g @rose_pine_variant 'dawn'

  ln -fs "$HOME/.config/alacritty/themes/catppuccin_latte.toml" "$alacritty_theme_file"
  /opt/homebrew/bin/tmux run-shell "$HOME/.tmux/plugins/tmux/catppuccin.tmux"
fi

touch "$HOME/.config/alacritty/alacritty.toml"
