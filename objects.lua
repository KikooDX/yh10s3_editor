--objects sprites & size
objects_data = {
  [75] = {}, --bloc
  [76] = {height = 32}, --exit door
  [77] = {height = 32}, --entry door
  [78] = {}, --spike
  [79] = {}, --conveyor left
  [80] = {}, --conveyor right
  [81] = {off_x = 8, off_y = 8}, --teleporter in
  [82] = {off_x = 8, off_y = 8}, --teleporter out
  [83] = {}, --key
  [84] = {}, --button
  [85] = {}, --button bloc
  [86] = {}, --gravity arrow up
  [87] = {}, --gravity arrow down
  [88] = {}, --water surface
  [89] = {}, --water
  [90] = {}, --ice
  [91] = {}, --laser canon
  [92] = {} --invisible bloc
}

objects_list = {}
for i, _ in pairs(objects_data) do
  objects_data[i].sprite = love.graphics.newImage("assets/o/"..tostring(i)..".png")
  if not objects_data[i].height then objects_data[i].height = 16 end
  if not objects_data[i].width then objects_data[i].width = 16 end
  table.insert(objects_list, i)
end
