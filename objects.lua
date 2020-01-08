--objects sprites & size
objects_data = {
  [75] = {
    width  = 16,
    height = 16
  },
  [78] = {
    width  = 16,
    height = 16
  },
  [76] = {
    width  = 16,
    height = 32
  },
  [77] = {
    width  = 16,
    height = 32
  },
  [92] = {
    width  = 16,
    height = 16
  }
}
objects_list = { 75, 78, 77, 76, 92 }

for _, v in ipairs(objects_list) do
  objects_data[v].sprite = love.graphics.newImage("assets/o/"..tostring(v)..".png")
end
