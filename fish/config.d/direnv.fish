if not type -q direnv
  return
end

direnv hook fish | source
