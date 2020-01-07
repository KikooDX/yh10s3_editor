function love.mousepressed(x, y, button)
  if button == 1 then
    mouse_mode = 1
  elseif button == 2 then
    mouse_mode = -1
  end
end

function love.mousereleased(x, y, button)
   mouse_mode = 0
end
