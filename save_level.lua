function save_level()
  if file_path ~= "" then
    local default_output = io.output() --save default output for later
    file = io.open(file_path, "w")
    io.output(file) --open file
    io.write(levelinfos, "[save]\n")
    object_id = 0
    for layer_id, layer in pairs(layers) do --read all the layers and write them
      for _, object in pairs(layer) do
        for i = 0, 2, 1 do
          to_write = object[i+1]
          if i == 1 then
            local off_x = objects_data[object[1]].off_x
            if off_x then to_write = to_write + off_x end
          elseif i == 2 then
            local off_y = objects_data[object[1]].off_y
            if off_y then to_write = to_write + off_y end
          end
          io.write(object_id, i, "=", to_write, "\n")
        end
        object_id = object_id + 1
      end
      if #layer ~= 0 and layer_id ~= #layers then io.write(";\n") end
    end
    io.close(file)
    io.output(default_output)
  end
end

function load_level()
  if file_path ~= "" then
    layers = { {} }
    visible_layers = { true }
    layer_selected = 1
    local default_input = io.input() --save default output for later
    current_layer = 1
    current_object = 1
    step = 1
    file = io.open(file_path, "r")
    levelinfos = ""
    in_infos = true
    for line in file:lines() do
      if in_infos then
        if line == "[save]" then in_infos = false
        else levelinfos = (levelinfos .. line .. "\n") end
      elseif line == ";" then
        current_object = 1
        step = 1
        layer_new()
        --current_layer = #layers
      elseif line ~= "" then
        to_sub = 0
        if step == 1 then table.insert(layers[current_layer], {})
        elseif step == 2 then
          to_sub = objects_data[layers[current_layer][current_object][1]].off_x
        elseif step == 3 then
          to_sub = objects_data[layers[current_layer][current_object][1]].off_y
        end
        if not to_sub then to_sub = 0 end
        local equal_pos = string.find(line, "=")
        local value = string.sub(line, equal_pos + 1)
        table.insert(layers[current_layer][current_object],
          tonumber(value) - to_sub)
        step = step + 1
        if step == 4 then step = 1 current_object = current_object + 1 end
      end
    end
  end
end


function love.filedropped(file_dropped)
  file_path = file_dropped:getFilename()
  load_level()
  save_level()
  load_level()
  save_level()
end
