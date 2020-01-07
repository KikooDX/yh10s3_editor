function love.load()
  dofile("load.lua")            --love.load
  dofile("draw.lua")            --love.draw
  dofile("mouse.lua")           --mouse input handling
  scaling = 0
  --dofile("keyboard.lua") --keyboard input handling
  --boudaries
  bounds = { min_x = 128, min_y = 16, max_x = 386, max_y = 272 }
end

function love.update(dt)
  next_time = next_time + min_dt --fps cap
  updatemouse()

  if gameIsPaused then return end --pause handling
end

function love.focus(f) gameIsPaused = not f end
