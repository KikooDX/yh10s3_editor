function love.draw()
  draw_boundaries()
  draw_mouse()
  draw_object_prediction()
  dofile("scale.lua") --store calculated scaling in 'scaling'
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
    love.graphics.setColor(1, 1, 1, 1) --alpha reset
    love.graphics.scale(scaling)
    love.graphics.draw(s_cursor[mouse_mode], mouse_x*scaling, mouse_y*scaling)
  end
end

function draw_boundaries()
  love.graphics.setColor(0.1, 0.1, 0.1, 1) --dark gray
  love.graphics.scale(scaling)
  love.graphics.rectangle("line", bounds.min_x*scaling, bounds.min_y*scaling,
                          256*scaling, 256*scaling)
end

function draw_object_prediction()
  love.graphics.scale(scaling)
  love.graphics.setColor(1, 1, 1, 0.2) --20% alpha
  trunc_x = mouse_x - mouse_x % 8
  trunc_y = mouse_y - mouse_y % 8
  if (trunc_x >= bounds.min_x) and (trunc_x <= bounds.max_x) and
     (trunc_y >= bounds.min_y) and (trunc_y <= bounds.max_y) then
    love.graphics.draw(s_cursor[mouse_mode], trunc_x*scaling, trunc_y*scaling)
  end
end
