--fps cap
min_dt = 1/60
next_time = love.timer.getTime()
--set font
love.graphics.setNewFont("Kenney Future Narrow.ttf", 12)
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
layers = { {  } }
--mouse_position buffer
buffer_x, buffer_y = 0, 0
--shortcuts
user_shortcuts = {75, 78, 79, 81, 83, 84, 86, 88, 76}
--object selected
slot_selected = 1
object_selected = user_shortcuts[slot_selected]
object_cursor = 1
