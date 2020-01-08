function update_mouse()
  mouse_x, mouse_y = love.mouse.getX(), love.mouse.getY() --mouse position
  clip_mouse_x = mouse_x - mouse_x % grid_spacing
  clip_mouse_y = mouse_y - mouse_y % grid_spacing
  --edition mode
  mouse_mode = 0
  if love.mouse.isDown(1) then
    mouse_mode = 1
  elseif love.mouse.isDown(2) then
    mouse_mode = -1
  end
end
