function draw_gui_layers()
  for i = 1, #layers, 1 do
    local pos_i = #layers - i + 1
    if i == layer_selected then love.graphics.setColor(0.8, 0.8, 0.8, 1)
    else love.graphics.setColor(0.2, 0.2, 0.2, 1) end
    rem_y = pos_i * 18 - 2
    love.graphics.rectangle("line", GAME_WIDTH - 96, rem_y, 95, 16)
    love.graphics.print("Layer "..pos_i, GAME_WIDTH - 92, pos_i * 18 - 1)
    love.graphics.draw(s_gui.up_down, GAME_WIDTH - 27, rem_y + 2)
    if visible_layers[i] then
      love.graphics.draw(s_gui.see, GAME_WIDTH - 39, rem_y + 2)
    else
      love.graphics.draw(s_gui.blind, GAME_WIDTH - 39, rem_y + 2)
    end
  end
  love.graphics.setColor(0.8, 0.8, 0.8, 1)
  love.graphics.draw(s_gui.new, GAME_WIDTH - 15, #layers * 18 + 18)
end

function select_layer()
  for i = 1, #layers, 1 do
    if love.keyboard.isDown("f"..i) then
      layer_selected = #layers - i + 1
    end
  end
end
