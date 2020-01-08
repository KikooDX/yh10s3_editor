function love.load()
  dofile("load.lua")     --love.load
  dofile("draw.lua")     --love.draw
  dofile("mouse.lua")    --mouse input handling
  dofile("keyboard.lua") --keyboard input handling
  dofile("layers.lua")   --layers gestion
end

function love.update(dt)
  next_time = next_time + min_dt --fps cap
  update_mouse()
  update_keyboard()

  if gameIsPaused then return end --pause handling
end

function love.focus(f) gameIsPaused = not f end
