--objects sprites & size
objects_data = {
  [75] = {}, --editor bloc
  [76] = {height = 32}, --editor exit door
  [77] = {height = 32}, --editor entry door
  [78] = {}, --editor spike
  [92] = {} --editor invisible bloc
}
objects_list = { 75, 78, 77, 76, 92 }

for _, v in ipairs(objects_list) do
  objects_data[v].sprite = love.graphics.newImage("assets/o/"..tostring(v)..".png")
  if not objects_data[v].height then objects_data[v].height = 16 end
  if not objects_data[v].width then objects_data[v].width = 16 end
end
