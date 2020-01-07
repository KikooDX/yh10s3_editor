function love.draw()
  draw_mouse()
  draw_boundaries()
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
  love.graphics.draw(s_cursor[mouse_mode], mouse_x, mouse_y)
end

function draw_boundaries()
  love.graphics.rectangle("line", 128, 16, 256, 256, 0, 0)
end

function draw_object_prediction()
  love.graphics.setColor(16, 16, 16, 16)
  love.graphics.draw(s_cursor[mouse_mode], mouse_x-mouse_x%16, mouse_y-mouse_y%16)
  love.graphics.setColor(16, 16, 16, 255)
end
