if not status is-interactive && test "$argv[1]" != "update"
    return
end

set -x LC_CTYPE en_US.UTF-8
set -x LC_ALL en_US.UTF-8

if test -z "$__fish_dotfile_inited"

  if not type -q fisher
    curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher
  end
  fisher update

  cd (dirname (realpath (status -f)))

  set -Up fish_function_path "$PWD/functions"

  fish_add_path -a "$PWD/bin"

  for f in $DOTFILES/*/conf.d/*.fish
    ln -sf "$f" "$HOME/.config/fish/conf.d/(basename $f)"
  end

  source "$PWD/setup.fish"

  set -U __fish_dotfile_inited true

  echo "fish shell initialized"
end

if test -f ~/.local.fish
  source ~/.local.fish
end
