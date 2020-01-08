function update_keyboard()
  --get keys inputs
  --grid increase if pageup
  local buffer = k_pageup
  k_pageup = love.keyboard.isScancodeDown("pageup")
  if k_pageup and not buffer and grid_spacing <= 8 then
    grid_spacing = grid_spacing * 2
  end
  --grid reduction if pagedown
  local buffer = k_pagedown
  k_pagedown = love.keyboard.isScancodeDown("pagedown")
  if k_pagedown and not buffer and grid_spacing >= 2 then
    grid_spacing = grid_spacing / 2
  end
  --debug key
  if love.keyboard.isScancodeDown("d") then debug.debug() end
  --mute
  local buffer = k_m
  k_m = love.keyboard.isDown("m")
  if k_m and not buffer then sfx = not sfx end
  --swap selected object
  local buffer = k_tab
  k_tab = love.keyboard.isScancodeDown("tab")
  if k_tab and not buffer then
    object_cursor = object_cursor + 1
    if object_cursor > #objects_list then object_cursor = 1 end
    object_selected = objects_list[object_cursor]
    if sfx then s_scroll:stop() s_scroll:play() end
  end
  --objects shortcuts
  for i = 0, 9, 1 do
    if love.keyboard.isScancodeDown(tostring(i)) then
      if love.keyboard.isDown("lshift") then
        user_shortcuts[i+1] = object_selected
      else
        object_selected = user_shortcuts[i+1]
        if sfx then s_scroll:play() end
      end
    end
  end
  --exit
  if love.keyboard.isDown("escape") then
    love.event.quit()
  end
end
