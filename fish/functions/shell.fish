
function fish-update -d "update fish config"
  set -Ue __fish_config_inited

  source $HOME/.config/fish/config.fish update
end

