function love.draw()
  love.graphics.scale(scale)
  love.graphics.setLineWidth(scale)
  draw_boundaries()
  draw_layers() --in 'layers.lua'
  draw_object_prediction()
  draw_gui()
  if (disp_grid) then draw_grid() end
  draw_mouse()
  if message.time_left ~= 0 then draw_message() end

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
    love.mouse.setCursor(s_cursor[mouse_mode])
  end
end

function draw_boundaries()
  love.graphics.setColor(0.2, 0.2, 0.2, 1) --dark gray
  love.graphics.rectangle("line", bounds.min_x, bounds.min_y, 256, 256)
  love.graphics.rectangle("line", bounds.min_x+16, bounds.min_y+16, 224, 224)
end

function draw_object_prediction()
  love.graphics.setColor(1, 1, 1, 0.5) --alpha 50%
  if (clip_mouse_x >= bounds.min_x) and (clip_mouse_x <= bounds.max_x) and
     (clip_mouse_y >= bounds.min_y) and (clip_mouse_y <= bounds.max_y) then
    love.graphics.draw(objects_data[object_selected].sprite,
                       clip_mouse_x, clip_mouse_y)
  end
end

function draw_gui()
  draw_slots()
  draw_gui_layers()
end

function draw_message()
  local darkness = message.time_left / MESSAGE_DEFAULT_DURATION
  love.graphics.setColor(darkness, darkness, darkness, 1)
  love.graphics.print(message.text, 8, 5)
  message.time_left = message.time_left - 1
end

function draw_grid()
  love.graphics.setColor(0.5, 0.5, 0.5, 0.2)
  love.graphics.setLineWidth(0.1)
  for i = 0, 256, grid_spacing do
    love.graphics.line(bounds.min_x, bounds.min_y + i, bounds.min_x + 256, bounds.min_y + i)
    love.graphics.line(bounds.min_x + i, bounds.min_y, bounds.min_x + i, bounds.min_y + 256)
  end
  love.graphics.setLineWidth(scale)
end
