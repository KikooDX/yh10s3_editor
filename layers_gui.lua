function draw_gui_layers()
  for i = 1, #layers, 1 do
    local pos_i = #layers - i + 1
    if i == layer_selected then love.graphics.setColor(0.8, 0.8, 0.8, 1)
    else love.graphics.setColor(0.2, 0.2, 0.2, 1) end
    love.graphics.rectangle("line", GAME_WIDTH - 96, pos_i * 18 - 2, 95, 16)
    love.graphics.print("Layer "..pos_i, GAME_WIDTH - 92, pos_i * 18 - 1)
  end
end

function select_layer()
  for i = 1, #layers, 1 do
    if love.keyboard.isDown("f"..i) then
      layer_selected = #layers - i + 1
    end
  end
end
