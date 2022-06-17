function ql -d "Previews files in Quick look."
  if not type -q qlmanage
    return
  end

  qlmanage -p "$argv" &> /dev/null
end
