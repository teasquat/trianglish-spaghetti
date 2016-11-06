require "geometry"

local time, P, E

export a = 500

class Cube
  new: (@x, @y, @z, @l) =>
    @points = {}

    for x = 0, 1
      for y = 0, 1
        for z = 0, 1
          table.insert @points, Point @l * x + @x, @l * y + @y, @l * z + @z

  update: =>
    @points = {}

    for x = 0, 1
      for y = 0, 1
        for z = 0, 1
          table.insert @points, Point @l * x + @x, @l * y + @y, @l * z + @z

  draw: =>
    for point in *@points
      point\draw!

love.load = ->
  time = 0
  P = Cube(0,0,0,100)

love.update = (dt) ->
  time += dt
  P.x = math.cos(time)* 100
  P.y = math.sin(time)* 100
  P\update!

love.draw = ->
  love.graphics.translate love.graphics.getWidth! / 2, love.graphics.getHeight! / 2
  love.graphics.scale 1, -1

  P\draw!
