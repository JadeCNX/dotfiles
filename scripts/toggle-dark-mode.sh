#!/bin/sh

osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode'

DARK_MODE=$(defaults read -g AppleInterfaceStyle 2>&1)
# echo "DARK_MODE=$DARK_MODE"

if [ "$DARK_MODE" = "Dark" ]; then
  /opt/homebrew/bin/gsed -i -r 's/catppuccin-\w+/catppuccin-mocha/' ~/.config/alacritty/alacritty.toml
  /opt/homebrew/bin/gsed -i -r "s/catppuccin_flavour '\\w+'/catppuccin_flavour 'mocha'/" ~/.tmux.conf
else
  /opt/homebrew/bin/gsed -i -r 's/catppuccin-\w+/catppuccin-latte/' ~/.config/alacritty/alacritty.toml
  /opt/homebrew/bin/gsed -i -r "s/catppuccin_flavour '\\w+'/catppuccin_flavour 'latte'/" ~/.tmux.conf
fi

/opt/homebrew/bin/tmux source-file ~/.tmux.conf
