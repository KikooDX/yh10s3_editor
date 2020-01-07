local f_scale_x, f_scale_y, _ = love.window.getMode()
if (f_scale_x / GAME_WIDTH) > (f_scale_y / GAME_WIDTH) then
  scaling = f_scale_x / GAME_WIDTH
else
  scaling = f_scale_y / GAME_HEIGHT
end
