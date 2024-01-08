#!/bin/sh

DARK_MODE="$1"

if [ "$DARK_MODE" = "dark" ]; then
  tmux set -g @catppuccin_flavour 'mocha'
  tmux set -g @rose_pine_variant 'moon'

  /opt/homebrew/bin/gsed -i -r 's/themes-\w+/themes-dark/' "$HOME/.config/alacritty/alacritty.toml"
else 
  tmux set -g @catppuccin_flavour 'latte'
  tmux set -g @rose_pine_variant 'dawn'

  /opt/homebrew/bin/gsed -i -r 's/themes-\w+/themes-light/' "$HOME/.config/alacritty/alacritty.toml"
fi

/opt/homebrew/bin/tmux run-shell "$HOME/.tmux/plugins/tmux/rose-pine.tmux"
