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
  if love.keyboard.isDown("d") then debug.debug() end
  --mute
  local buffer = k_m
  k_m = love.keyboard.isDown("m")
  if k_m and not buffer then sfx = not sfx end
  --swap selected object
  local buffer = k_tab
  k_tab = love.keyboard.isScancodeDown("tab")
  if k_tab and not buffer then
    if love.keyboard.isDown("lshift") then
      object_cursor = object_cursor - 1
      if object_cursor == 0 then object_cursor = #objects_list end
    else object_cursor = object_cursor + 1
      if object_cursor > #objects_list then object_cursor = 1 end
    end
    object_selected = objects_list[object_cursor]
    user_shortcuts[slot_selected] = object_selected
    if sfx then s_scroll:stop() s_scroll:play() end
  end
  --objects shortcuts
  for i = 1, 9, 1 do
    if love.keyboard.isScancodeDown(tostring(i)) then
      select_slot(i)
    end
  end
  --exit
  if love.keyboard.isScancodeDown("escape") then
    love.event.quit()
  end
  --layer selection
  select_layer()
  --special shortcuts for layers
  if love.keyboard.isScancodeDown("lctrl") then
    buffer = k_del
    k_del = love.keyboard.isScancodeDown("delete")
    if k_del and not buffer and #layers >= 2 then layer_del(layer_selected) end
  end
end
