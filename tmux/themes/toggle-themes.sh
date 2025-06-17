#!/bin/sh

dark_mode="$1"

TM=/opt/homebrew/bin/tmux

$TM set -ug @thm_bg
$TM set -ug @thm_fg
$TM set -ug @thm_rosewater
$TM set -ug @thm_flamingo
$TM set -ug @thm_rosewater
$TM set -ug @thm_pink
$TM set -ug @thm_mauve
$TM set -ug @thm_red
$TM set -ug @thm_maroon
$TM set -ug @thm_peach
$TM set -ug @thm_yellow
$TM set -ug @thm_green
$TM set -ug @thm_teal
$TM set -ug @thm_sky
$TM set -ug @thm_sapphire
$TM set -ug @thm_blue
$TM set -ug @thm_lavender
$TM set -ug @thm_subtext_1
$TM set -ug @thm_subtext_0
$TM set -ug @thm_overlay_2
$TM set -ug @thm_overlay_1
$TM set -ug @thm_overlay_0
$TM set -ug @thm_surface_2
$TM set -ug @thm_surface_1
$TM set -ug @thm_surface_0
$TM set -ug @thm_mantle
$TM set -ug @thm_crust

if [ "$dark_mode" = "dark" ]; then
  $TM set -g @catppuccin_flavor 'mocha'
  $TM set -g @rose_pine_variant 'moon'
  $TM run-shell "$HOME/.tmux/plugins/tmux/catppuccin.tmux"
else
  $TM set -g @catppuccin_flavor 'latte'
  $TM set -g @rose_pine_variant 'dawn'
  $TM run-shell "$HOME/.tmux/plugins/tmux/catppuccin.tmux"
fi

tmux source-file "$(dirname "$0")/theme.conf"
