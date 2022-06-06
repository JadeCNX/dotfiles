#
# Homebrew
#

if not type -q brew
  return
end


# Homebrew
alias brewc='brew cleanup'
alias brewI='brew info'
alias brewi='brew install'
alias brewL='brew leaves'
alias brewl='brew list'
alias brewo='brew outdated'
alias brewr='brew reinstall'
alias brews='brew search'
alias brewu='brew upgrade'
alias brewx='brew uninstall'

# Homebrew Cask
alias caski='brew install --cask'
alias caskl='brew list --cask'
alias casko='brew outdated --cask'
alias casks='brew search --cask'
alias casku='brew upgrade --cask'
alias caskx='brew uninstall --cask'


