function love.draw()
  draw_boundaries()
  draw_layers() --in 'layers.lua'
  draw_mouse()
  draw_object_prediction()

  --fps cap
  local cur_time = love.timer.getTime()
  if next_time <= cur_time then
    next_time = cur_time
    return
  end
  love.timer.sleep(next_time - cur_time)
end

function draw_mouse()
  if (mouse_x ~= 0) and (mouse_x ~= GAME_WIDTH-1) and
     (mouse_y ~= 0) and (mouse_y ~= GAME_HEIGHT-1) then
    love.graphics.setColor(1, 1, 1, 0.8) --alpha 80%
    love.graphics.draw(s_cursor[mouse_mode], mouse_x, mouse_y)
  end
end

function draw_boundaries()
  love.graphics.setColor(0.1, 0.1, 0.1, 1) --dark gray
  love.graphics.rectangle("line", bounds.min_x, bounds.min_y, 256, 256)
end

function draw_object_prediction()
  love.graphics.setColor(1, 1, 1, 0.2) --alpha 20%
  trunc_x = mouse_x - mouse_x % grid_spacing
  trunc_y = mouse_y - mouse_y % grid_spacing
  if (trunc_x >= bounds.min_x) and (trunc_x <= bounds.max_x) and
     (trunc_y >= bounds.min_y) and (trunc_y <= bounds.max_y) then
    love.graphics.draw(s_cursor[mouse_mode], trunc_x, trunc_y)
  end
end
