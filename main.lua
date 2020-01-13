function love.load()
  require("load")       --love.load
  require("sound")      --load sound files
  require("draw")       --love.draw
  require("mouse")      --mouse input handling
  require("keyboard")   --keyboard input handling
  require("layers")     --layers gestion
  require("objects")    --objects data
  require("slots")      --slots handling
  require("layers_gui") --layers gui
  require("save_level") --level saving system
  require("quit")       --code executed when quiting the program
end

function love.update(dt)
  next_time = next_time + min_dt --fps cap
  update_mouse()
  update_keyboard()

  if gameIsPaused then return end --pause handling
end

function love.focus(f) gameIsPaused = not f end

function set_message(text)
  message.text = text
  message.time_left = MESSAGE_DEFAULT_DURATION
end
