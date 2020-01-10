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
          io.write(object_id, i, "=", object[i+1], "\n")
        end
        object_id = object_id + 1
      end
      if layer_id ~= #layers then io.write(";\n") end
    end
    io.close(file)
    io.output(default_output)
  end
end
