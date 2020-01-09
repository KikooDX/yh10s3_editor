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
  for i = 1, #layers, 1 do if visible_layers[i] then draw_layer(i) end end
end

function add_to_layer(layer_id)
  table.insert(layers[layer_id], { object_selected, clip_mouse_x, clip_mouse_y })
end

function rem_of_layer(layer_id)
  local final_layer = {}
  local different = false
  for _, object in pairs(layers[layer_id]) do
    local object_data = objects_data[object[1]]
    local collisions = { min_x = object[2], min_y = object[3],
    max_x = object[2]+object_data.width, max_y = object[3]+object_data.height }
    if not (clip_mouse_x >= collisions.min_x and clip_mouse_x < collisions.max_x and
            clip_mouse_y >= collisions.min_y and clip_mouse_y < collisions.max_y) then
      table.insert(final_layer, object)
    else different = true
    end
  end
  if sfx and different then s_remove:stop() s_remove:play() end
  table.remove(layers, layer_id)
  table.insert(layers, layer_id, final_layer)
end

function layer_move_down(layer_id)
  if layer_id + 1 > #layers then return end
  local layer = layers[layer_id]
  local visibility = visible_layers[layer_id]
  table.remove(layers, layer_id)
  table.insert(layers, layer_id + 1, layer)
  table.remove(visible_layers, layer_id)
  table.insert(visible_layers, layer_id + 1, visibility)
  layer_selected = layer_selected + 1
end

function layer_move_up(layer_id)
  if layer_id - 1 == 0 then return end
  local layer = layers[layer_id]
  local visibility = visible_layers[layer_id]
  table.remove(layers, layer_id)
  table.insert(layers, layer_id - 1, layer)
  table.remove(visible_layers, layer_id)
  table.insert(visible_layers, layer_id - 1, visibility)
  layer_selected = layer_selected - 1
end

function layer_del(layer_id)
  table.remove(layers, layer_id)
  table.remove(visible_layers, layer_id)
  if layer_selected > #layers then layer_selected = #layers end
end

function layer_new(layer_id)
  if #layers == 9 then return end
  table.insert(layers, 1, {})
  table.insert(visible_layers, 1, true)
  layer_selected = layer_selected + 1
  s_place:play()
end
