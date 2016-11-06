require "geometry"
require "data/obj"

local time, cube, line

export a = 500

love.load = ->

  data = love.filesystem.read("res/hypercube.wtf")

  test = Loader\load data
  cube = Group test.v, 100
  cube\add_lines test.l
  time = 0

love.update = (dt) ->
  time += dt
  cube.offset[1] = math.sin(time)*100
  cube.scale = math.cos(time)*100

love.draw = ->
  love.graphics.translate love.graphics.getWidth! / 2, love.graphics.getHeight! / 2
  love.graphics.scale 1, -1
  cube\draw!
