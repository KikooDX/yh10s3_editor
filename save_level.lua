function save_level()
  if file_path ~= "" then
    local default_output = io.output() --save default output for later
    file = io.open(file_path, "w")
    io.output(file) --open file
    io.write("[save]\n")
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
      if layer_id ~= #layers then io.write(";\n") end
    end
    io.close(file)
    io.output(default_output)
  end
end
