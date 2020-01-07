--fps cap
min_dt = 1/60
next_time = love.timer.getTime()
--game size
GAME_WIDTH = 512
GAME_HEIGHT = 288
love.window.setMode(GAME_WIDTH, GAME_HEIGHT)
--set font
love.graphics.setNewFont("Kenney Future Narrow.ttf", 48)
love.graphics.setColor(32, 32, 32)
love.graphics.setBackgroundColor(0, 0, 0)
--mouse settings
mouse_mode = 0
love.mouse.setVisible(false)
s_cursor = {
  [0]  = love.graphics.newImage("mouse_cursor.png"),
  [1]  = love.graphics.newImage("mouse_cursor_place.png"),
  [-1] = love.graphics.newImage("mouse_cursor_del.png")
}
