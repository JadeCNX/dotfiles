#
# Node
#

if not type -q node
  return
end

if not type -q fnm
  fnm env --use-on-cd | source
end

# npm
alias npmi='npm install'
alias npml='npm list'
alias npmo='npm outdated'
alias npmp='npm publish'
alias npmP='npm prune'
alias npmr='npm run'
alias npms='npm search'
alias npmt='npm test'
alias npmu='npm update'
alias npmx='npm uninstall'

alias npmci='npm ci'
alias npmcit='npm cit'
alias npmit='npm it'


