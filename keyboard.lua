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
  if love.keyboard.isScancodeDown("d") then
    debug.debug()
  end
  --swap selected object
  local buffer = k_tab
  k_tab = love.keyboard.isScancodeDown("tab")
  if k_tab and not buffer then
    object_cursor = object_cursor + 1
    if object_cursor > #objects_list then object_cursor = 1 end
    object_selected = objects_list[object_cursor]
  end
end
