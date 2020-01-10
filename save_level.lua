if file_path ~= "" then
  local default_output = io.output() --save default output for later
  io.output(io.open(file_path, "w")) --create/clear the save file and open it
  io.write("hey")
  io.input(default_output) --restore default output
end
