function draw_layer(layer_id)
  --[[the layer group contains layers, which contains
  objects which contains their id, x, y]]
  local layer = layers[layer_id]
  if not layer then return end
  love.graphics.setColor(1, 1, 1, 1) --alpha reset
  for _, object in pairs(layer) do
    local object_id = object[1]
    object_data = objects_data[object_id]
    love.graphics.draw(object_data.sprite, object[2], object[3])
  end
end

function draw_layers()
  draw_layer(1)
end

function add_to_layer(layer_id)
  table.insert(layers[layer_id], { 75, clip_mouse_x, clip_mouse_y })
end
