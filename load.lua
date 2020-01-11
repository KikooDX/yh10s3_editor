--scaling
love.graphics.setDefaultFilter("nearest", "nearest")
--message
message = {text = "", time_left = 0}
MESSAGE_DEFAULT_DURATION = 120
--fps cap
min_dt = 1/60
next_time = love.timer.getTime()
--set font
love.graphics.setNewFont("assets/Kenney Future Narrow.ttf", 12)
love.graphics.setBackgroundColor(0, 0, 0)
--mouse settings
mouse_mode = 0
s_cursor = {
  [0]  = love.mouse.newCursor("assets/mouse_cursor.png"),
  [1]  = love.mouse.newCursor("assets/mouse_cursor_place.png"),
  [-1] = love.mouse.newCursor("assets/mouse_cursor_del.png")
}
--gui boutons
s_gui = {
  see     = love.graphics.newImage("assets/gui/see.png"),
  blind   = love.graphics.newImage("assets/gui/blind.png"),
  delete  = love.graphics.newImage("assets/gui/delete.png"),
  up_down = love.graphics.newImage("assets/gui/up_down.png"),
  new     = love.graphics.newImage("assets/gui/new.png")
}
--unknown texture
s_unknown = love.graphics.newImage("assets/unknown.png")
--boudaries
bounds = { min_x = 128, min_y = 16, max_x = 370, max_y = 256 }
grid_spacing = 8 --object clipping setting
--layers
layers = { {} }
visible_layers = { true }
layer_selected = 1
--mouse_position buffer
buffer_x, buffer_y = 0, 0
--shortcuts
user_shortcuts = { 75, 78, 79, 81, 83, 84, 86, 88, 76 }
--object selected
slot_selected = 1
object_selected = user_shortcuts[slot_selected]
object_cursor = 1
--saving
file_path = "level.yh10s3"
levelinfos = [[[levelinfos]
;music
1=45
;level name
2=Unnamed 0
;background
3=1
;motion sensor
4=0
;darkness
5=0
]]
