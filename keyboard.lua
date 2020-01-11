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
  --saving/export
  local buffer = k_s
  k_s = love.keyboard.isDown("s")
  if k_s and not buffer then
    save_level()
    set_message("Level SAVED")
  end
  local buffer = k_o
  k_o = love.keyboard.isDown("o")
  if k_o and not buffer then
    load_level()
    save_level()
    load_level()
    save_level()
    set_message("Level LOADED")
  end
  --layer selection
  select_layer()
  --special shortcuts for layers
  if love.keyboard.isScancodeDown("lctrl") then
    local buffer = k_del
    k_del = love.keyboard.isScancodeDown("delete")
    if k_del and not buffer and #layers >= 2 then layer_del(layer_selected) end
    local buffer = k_n
    k_n = love.keyboard.isDown("n")
    if k_n and not buffer then layer_new() end
    local buffer = k_down
    k_down = love.keyboard.isScancodeDown("down")
    if k_down and not buffer then layer_move_up(layer_selected) end
    local buffer = k_up
    k_up = love.keyboard.isScancodeDown("up")
    if k_up and not buffer then layer_move_down(layer_selected) end
    local buffer = k_v
    k_v = love.keyboard.isDown("v")
    if k_v and not buffer then layer_change_visibility(layer_selected) end
  end
  --scaling
  local buffer = k_k
  k_k = love.keyboard.isDown("k")
  if k_k and not buffer and scale > 1 then
    scale = scale - 1
    love.window.setMode(GAME_WIDTH * scale, GAME_HEIGHT * scale, flags)
  end
  local buffer = k_l
  k_l = love.keyboard.isDown("l")
  if k_l and not buffer and scale < 8 then
    scale = scale + 1
    love.window.setMode(GAME_WIDTH * scale, GAME_HEIGHT * scale, flags)
  end
  --help
  local buffer = k_h
  k_h = love.keyboard.isDown("h")
  if k_h and not buffer then love.system.openURL("help.html") end
  --grip visu
  local buffer = k_g
  k_g = love.keyboard.isDown("g")
  if k_g and not buffer then disp_grid = not disp_grid end
end
