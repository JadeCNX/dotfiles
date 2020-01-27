scrollBind = hs.eventtap.new({hs.eventtap.event.types.scrollWheel}, function(e)
  if is_active('iTerm2') then
    local horizontalOffset = e:getProperty(hs.eventtap.event.properties.scrollWheelEventDeltaAxis2)

    if horizontalOffset ~= 0 then
      hs.eventtap.scrollWheel({ 0, horizontalOffset }, {"shift"}, 'pixel')
      return true
    end
  end

  return false
end):start()

function is_active(program_name)
  local active_window_name = hs.window.focusedWindow():application():name()
  return active_window_name == program_name
end
