function love.draw()
  draw_boundaries()
  draw_mouse()

  --fps cap
  local cur_time = love.timer.getTime()
  if next_time <= cur_time then
    next_time = cur_time
    return
  end
  love.timer.sleep(next_time - cur_time)
end

function draw_mouse()
  love.graphics.draw(s_cursor[mouse_mode], love.mouse.getX(), love.mouse.getY())
end

function draw_boundaries()
  love.graphics.rectangle("line", 128, 16, 256, 256, 0, 0)
end
