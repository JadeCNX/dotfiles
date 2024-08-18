#!/bin/sh

dark_mode="$1"
alacritty_theme_file="$HOME/.config/alacritty/theme.toml"
alacritty_config_file="$HOME/.config/alacritty/alacritty.toml"

if [ "$dark_mode" = "dark" ]; then
  tmux set -g @catppuccin_flavour 'mocha'
  tmux set -g @rose_pine_variant 'moon'

  cp "$HOME/.config/alacritty/themes/monokai_pro.toml" "$alacritty_theme_file"
  /opt/homebrew/bin/tmux run-shell "$HOME/.tmux/plugins/tmux-monokai-pro/monokai.tmux"
else
  tmux set -g @catppuccin_flavour 'latte'
  tmux set -g @rose_pine_variant 'dawn'

  cp "$HOME/.config/alacritty/themes/rose-pine-dawn.toml" "$alacritty_theme_file"
  /opt/homebrew/bin/tmux run-shell "$HOME/.tmux/plugins/tmux/rose-pine.tmux"
fi

touch "$alacritty_config_file"
