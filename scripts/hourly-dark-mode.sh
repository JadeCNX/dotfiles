#!/bin/sh

if [ $(( $(date +%H) % 2 )) -eq 0 ]; then
  osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to false'
else
  osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'
fi

# DARK_MODE=$(defaults read -g AppleInterfaceStyle 2>&1)
# echo "DARK_MODE=$DARK_MODE"

# if [ "$DARK_MODE" = "Dark" ]; then
#   /opt/homebrew/bin/gsed -i -r 's/catppuccin-\w+/catppuccin-mocha/' ~/.config/alacritty/alacritty.toml
# else
#   /opt/homebrew/bin/gsed -i -r 's/catppuccin-\w+/catppuccin-latte/' ~/.config/alacritty/alacritty.toml
# fi

# /opt/homebrew/bin/tmux source-file ~/.tmux.conf
