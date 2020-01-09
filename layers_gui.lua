function draw_gui_layers()
  for i, _ in pairs(layers) do
    local i = #layers - i + 1
    love.graphics.setColor(0.2, 0.2, 0.2, 1)
    love.graphics.rectangle("line", GAME_WIDTH - 96, i * 16, 96, 16)
    love.graphics.print("Layer "..i, GAME_WIDTH - 92, i * 16 + 1)
  end
end
