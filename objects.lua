--objects sprites & size
objects_data = {
  [75]  = {}, --bloc
  [76]  = {off_x = 8, off_y = 16}, --exit door
  [77]  = {off_x = 8, off_y = 16}, --entry door
  [78]  = {}, --spike
  [79]  = {}, --conveyor left
  [80]  = {}, --conveyor right
  [81]  = {off_x = 8, off_y = 8}, --teleporter in
  [82]  = {off_x = 8, off_y = 8}, --teleporter out
  [83]  = {}, --key
  [84]  = {}, --button
  [85]  = {}, --button bloc
  [86]  = {}, --gravity arrow up
  [87]  = {}, --gravity arrow down
  [88]  = {}, --water surface
  [89]  = {}, --water
  [90]  = {}, --ice
  [91]  = {}, --laser canon
  [92]  = {}, --invisible bloc
  [93]  = {}, --invisible spike
  [94]  = {}, --fake spike
  [95]  = {}, --invisible ice
  [96]  = {}, --chain
  [97]  = {}, --super conveyor left
  [98]  = {}, --super conveyor right
  [99]  = {}, --shrink ray
  [100] = {}, --glue
}

objects_list = {}
for i, _ in pairs(objects_data) do
  objects_data[i].sprite = love.graphics.newImage("assets/o/"..i..".png")
  objects_data[i].width, objects_data[i].height =
    objects_data[i].sprite:getPixelDimensions()
  print(love.graphics.getDimensions(objects_data[i].sprite))
  table.insert(objects_list, i)
  table.sort(objects_list)
end
