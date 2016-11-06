local time, P, E

a = 50

class Point
  radius = 4

  new: (@x, @y, @z) =>

  set_pos: (@x, @y, @z) =>

  get_2d: =>
    l = a + @z
    {a * @x / l, a * @y / l}

  draw: =>
    {x, y} = @get_2d!
    love.graphics.circle "fill", x, y, radius

class Cube
  new: (@x, @y, @z, @l) =>
    @points = {}

    for x = 0, 1
      for y = 0, 1
        for z = 0, 1
          table.insert(@points, Point(@l*x+@x, @l*y+@y, @l*z+@z))

  update: =>
    @points = {}

    for x = 0, 1
      for y = 0, 1
        for z = 0, 1
          table.insert(@points, Point(@l*x+@x, @l*y+@y, @l*z+@z))

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
