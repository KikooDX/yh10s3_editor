--objects sprites & size
objects_data = {
  [13]  = {}, --omg conveyor left
  [14]  = {}, --omg conveyor right
  [25]  = {}, --gravity arrow right
  [26]  = {}, --gravity arrow left
  [29]  = {}, --acid surface
  [30]  = {}, --acid
  [39]  = {}, --motion sensor
  [40]  = {}, --reverse motion sensor
  [42]  = {off_x = 8, off_y = 16}, --grow ray
  [50]  = {}, --x1 gravity
  [56]  = {}, --spike floor
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
  [101] = {}, --slow ray
  [102] = {}, --fast ray
  [103] = {}, --inverter
  [104] = {}, --reverter
  [105] = {}, --x2 gravity
  [106] = {}, --/2 gravity
  [107] = {}, --red laser gate
  [108] = {}, --blue laser gate
  [110] = {}, --timer reset
  [178] = {}, --thin platform
  [196] = {off_x = 8, off_y = 8}, --double jump item
  [240] = {}, --red colour door
  [241] = {}, --multicolour door
}

objects_list = {}
for i, _ in pairs(objects_data) do
  objects_data[i].sprite = love.graphics.newImage("assets/o/"..i..".png")
  objects_data[i].width, objects_data[i].height =
    objects_data[i].sprite:getPixelDimensions()
  table.insert(objects_list, i)
  table.sort(objects_list)
end
