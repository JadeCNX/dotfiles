function git-branch-current
  git branch 2>/dev/null | sed -n '/\* /s///p'
end
