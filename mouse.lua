function update_mouse()
  mouse_x, mouse_y = love.mouse.getX(), love.mouse.getY() --mouse position
  clip_mouse_x = mouse_x - mouse_x % grid_spacing
  clip_mouse_y = mouse_y - mouse_y % grid_spacing
  --edition mode
  mouse_mode = 0
  if (clip_mouse_x >= bounds.min_x) and (clip_mouse_x <= bounds.max_x) and
     (clip_mouse_y >= bounds.min_y) and (clip_mouse_y <= bounds.max_y) then
    if love.mouse.isDown(1) then
      mouse_mode = 1
    elseif love.mouse.isDown(2) then
      mouse_mode = -1
    end
  end
  if mouse_mode == 0 then buffer_x, buffer_y = 0, 0 end
  --add to layer if
  if mouse_mode == 1 and (clip_mouse_x ~= buffer_x or clip_mouse_y ~= buffer_y) then
    add_to_layer(layer_selected)
    if sfx then s_place:stop() s_place:play() end
    buffer_x = clip_mouse_x
    buffer_y = clip_mouse_y
  end
  --delete of layer if
  if mouse_mode == -1 and (clip_mouse_x ~= buffer_x or clip_mouse_y ~= buffer_y) then
    rem_of_layer(layer_selected)
    buffer_x = clip_mouse_x
    buffer_y = clip_mouse_y
  end
end

function love.mousepressed(x, y, button)
  local bound_x = 8
  local bound_y = 16
  if x >= bound_x and y >= bound_y and
     x <= bound_x + 76 and y <= bound_y + 252 then
    x = x - bound_x
    y = y - bound_y
    select_slot(math.floor(x / 26) + 1 + math.floor(y / 82) * 3)
    if sfx then s_scroll:play() end
  end
end
