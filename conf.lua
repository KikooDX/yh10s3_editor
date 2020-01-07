function love.conf(t)
  GAME_WIDTH = 512
  GAME_HEIGHT = 288
  t.window.width = GAME_WIDTH
  t.window.height = GAME_HEIGHT
  t.window.resizable = true
  t.modules.joystick = false
  t.modules.physics = false
  t.modules.touch = false
  t.modules.accelerometerjoystick = false
  t.identity = "yh10s3_editor"
  t.window.title = "YH10S3 Extended Editor"
end
