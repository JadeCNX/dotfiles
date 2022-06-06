if not type -q fortune
  return
end

if status --is-login 
  fortune -s
end

function on_exit --on-event fish_exit
  fortune -s
end
