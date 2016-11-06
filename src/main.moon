require "geometry"
require "data/obj"

local time, cube, line

export a = 500
export test_a = 45

love.load = ->

  data = love.filesystem.read("res/hypercube.wtf")

  test = Loader\load data
  cube = Group test.v, 100
  cube\add_lines test.l
  time = 0

love.update = (dt) ->
  time += dt

  test_a += dt

  cube.rotations = {
    {1, 0, 0, 0}
    {0, 1, 0, 0}
    {0, 0, (math.cos test_a), -(math.sin test_a)}
    {0, 0, (math.sin test_a), (math.cos test_a)}
  }

  --cube.offset[1] = math.sin(time) * 100
  --cube.offset[2] = math.cos(time) * 100

love.draw = ->
  love.graphics.translate love.graphics.getWidth! / 2, love.graphics.getHeight! / 2
  love.graphics.scale 1, -1
  cube\draw!
