----------------------------------
-- Representing a *hypercube* in an
-- arbitrary plane.
----------------------------------
class
  new: (@l, ...) =>

    @points = {}

    for x = 0, 1
      for y = 0, 1
        for z = 0, 1
          table.insert(@points, Point(@l * x + @x, @l * y + @y, @l * z + @z))

  update: =>
    @points = {}

    for x = 0, 1
      for y = 0, 1
        for z = 0, 1
          table.insert(@points, Point(@l * x + @x, @l * y + @y, @l * z + @z))

  draw: =>
    for point in *@points
      point\draw!
