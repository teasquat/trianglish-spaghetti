local time, P, E, a

love.load = ->
  time = 0
  P = {
      x:200
      y:200
      z:200
  }

  E = {
      :x
      :y
  }

  a = 50

love.update = (dt) ->
  time += dt

  P.y = ((math.sin time) + 1) * 100

  E.x = a * P.x / (a + P.z)
  E.y = a * P.y / (a + P.z)

love.draw = ->
  love.graphics.translate love.graphics.getWidth! / 2, love.graphics.getHeight! / 2
  love.graphics.scale 1, -1

  love.graphics.line 0, E.y, E.x, E.y, E.x, 0
  love.graphics.circle "fill", E.x, E.y, 4
