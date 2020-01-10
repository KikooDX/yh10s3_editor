function love.load()
  dofile("load.lua")       --love.load
  dofile("sound.lua")      --load sound files
  dofile("draw.lua")       --love.draw
  dofile("mouse.lua")      --mouse input handling
  dofile("keyboard.lua")   --keyboard input handling
  dofile("layers.lua")     --layers gestion
  dofile("objects.lua")    --objects data
  dofile("slots.lua")      --slots handling
  dofile("layers_gui.lua") --layers gui
  dofile("save_level.lua") --level saving system
  dofile("quit.lua")       --code executed when quiting the program
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
