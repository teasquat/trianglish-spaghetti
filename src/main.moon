require "geometry"
require "data/obj"

local time, cube, line

export a = 500

love.load = ->

  data = "
v 0.0 0.0 0.0
v 1.0 0.0 0.0
v 0.0 1.0 0.0
v 1.0 1.0 0.0
v 0.0 0.0 1.1
v 1.0 0.0 1.1
v 0.0 1.0 1.1
v 1.0 1.0 1.1
l 1 1
l 1 2
l 1 3
l 1 4
l 1 5
l 1 6
l 1 7
l 1 8
l 2 1
l 2 2
l 2 3
l 2 4
l 2 5
l 2 6
l 2 7
l 2 8
l 3 1
l 3 2
l 3 3
l 3 4
l 3 5
l 3 6
l 3 7
l 3 8
l 4 1
l 4 2
l 4 3
l 4 4
l 4 5
l 4 6
l 4 7
l 4 8
l 5 1
l 5 2
l 5 3
l 5 4
l 5 5
l 5 6
l 5 7
l 5 8
l 6 1
l 6 2
l 6 3
l 6 4
l 6 5
l 6 6
l 6 7
l 6 8
l 7 1
l 7 2
l 7 3
l 7 4
l 7 5
l 7 6
l 7 7
l 7 8
l 8 1
l 8 2
l 8 3
l 8 4
l 8 5
l 8 6
l 8 7
l 8 8"

  test = Loader\load data
  cube = Group test.v, 100
  cube\add_lines test.l
  time = 0

love.update = (dt) ->
  time += dt
  cube.offset[2] = math.sin(time) * 200
  cube.offset[1] = math.cos(time) * 200

love.draw = ->
  love.graphics.translate love.graphics.getWidth! / 2, love.graphics.getHeight! / 2
  love.graphics.scale 1, -1
  cube\draw!
