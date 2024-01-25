#!/bin/sh

DARK_MODE="$1"

if [ "$DARK_MODE" = "dark" ]; then
  tmux set -g @catppuccin_flavour 'mocha'
  tmux set -g @rose_pine_variant 'moon'

  /opt/homebrew/bin/gsed -i -r 's/themes-\w+/dark-theme/' "$HOME/.config/alacritty/toggle-theme.toml"
else 
  tmux set -g @catppuccin_flavour 'latte'
  tmux set -g @rose_pine_variant 'dawn'

  /opt/homebrew/bin/gsed -i -r 's/themes-\w+/light-theme/' "$HOME/.config/alacritty/toggle-theme.toml"
fi

/opt/homebrew/bin/tmux run-shell "$HOME/.tmux/plugins/tmux/catppuccin.tmux"
