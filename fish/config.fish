if not status is-interactive && test "$argv[1]" != "update"
    return
end

# Run initialized scripts
if test -z "$__fish_config_inited"

  # Install & update finser 
  if not type -q fisher
    curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher
  end
  fisher update

  set FISH_DOTFILES (dirname (realpath (status -f)))

  # Add functions dir
  set -Up fish_function_path "$FISH_DOTFILES/functions"

  # Setup fish shell
  for f in $FISH_DOTFILES/setup.d/*.fish
    source "$f"
  end

  set -U __fish_config_inited true

  echo "fish config initialized"
end

# Rebind keys for fish shell
for f in $FISH_DOTFILES/bind/*.fish
  source "$f"
end

# Run local fish script
if test -f ~/.local.fish
  source ~/.local.fish
end
