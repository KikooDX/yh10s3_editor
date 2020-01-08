--fps cap
min_dt = 1/60
next_time = love.timer.getTime()
--set font
love.graphics.setNewFont("Kenney Future Narrow.ttf", 48)
love.graphics.setBackgroundColor(0, 0, 0)
--mouse settings
mouse_mode = 0
love.mouse.setVisible(false)
s_cursor = {
  [0]  = love.graphics.newImage("assets/mouse_cursor.png"),
  [1]  = love.graphics.newImage("assets/mouse_cursor_place.png"),
  [-1] = love.graphics.newImage("assets/mouse_cursor_del.png")
}
--boudaries
bounds = { min_x = 128, min_y = 16, max_x = 386, max_y = 272 }
grid_spacing = 8 --object clipping setting
--layers
layers = { { {75, 256, 128} } }
--objects sprites
objects_data = {
  [75] = {
    sprite = love.graphics.newImage("assets/o/75.png"),
    width  = 16,
    height = 16
  }
}
