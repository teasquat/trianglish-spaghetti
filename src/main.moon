require "geometry"
require "data/obj"

local time, cube

export a = 500

love.load = ->

  data = "
v 0.0  0.0  0.0  0.0
v 0.0  0.0  1.0  0.0
v 0.0  1.0  0.0  0.0
v 0.0  1.0  1.0  0.0
v 1.0  0.0  0.0  0.0
v 1.0  0.0  1.0  0.0
v 1.0  1.0  0.0  0.0
v 1.0  1.0  1.0  0.0
v 0.0  0.0  0.0  1.0
v 0.0  0.0  1.0  1.0
v 0.0  1.0  0.0  1.0
v 0.0  1.0  1.0  1.0
v 1.0  0.0  0.0  1.0
v 1.0  0.0  1.0  1.0
v 1.0  1.0  0.0  1.0
v 1.0  1.0  1.0  1.0"

  test = Loader\load data
  cube = Group(test.v, 100)
  time = 0

love.update = (dt) ->
  time += dt
  cube.offset = math.sin(time)*100
  cube.scale = math.cos(time)*100

love.draw = ->
  love.graphics.translate love.graphics.getWidth! / 2, love.graphics.getHeight! / 2
  love.graphics.scale 1, -1
  cube\draw!
