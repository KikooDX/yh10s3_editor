function love.load()
  dofile("load.lua")     --love.load
  dofile("draw.lua")     --love.draw
  dofile("mouse.lua")    --mouse input handling
  --dofile("keyboard.lua") --keyboard input handling
  --boudaries
  bounds = { min_x = 128, min_y = 16, max_x = 386, max_y = 272 }
end

function love.update(dt)
  next_time = next_time + min_dt --fps cap
  mouse_x, mouse_y = love.mouse.getX(), love.mouse.getY()--mouse position

  if gameIsPaused then return end --pause handling
end

function love.focus(f) gameIsPaused = not f end