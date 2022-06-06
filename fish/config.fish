if not status is-interactive && test "$argv[1]" != "update"
    return
end

set -x LC_CTYPE en_US.UTF-8
set -x LC_ALL en_US.UTF-8

if test -z "$__fish_config_inited"

  if not type -q fisher
    curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher
  end
  fisher update

  set FISH_DOTFILES (dirname (realpath (status -f)))

  echo "fish dotfiles : $FISH_DOTFILES"

  set -Up fish_function_path "$FISH_DOTFILES/functions"

  fish_add_path -a "$FISH_DOTFILE"

  for f in $FISH_DOTFILES/config.d/*.fish
    ln -sf $f $HOME/.config/fish/conf.d/(basename $f)
  end

  source "$FISH_DOTFILES/setup.fish"

  set -U __fish_config_inited true

  echo "fish config initialized"
end

if test -f ~/.local.fish
  source ~/.local.fish
end
