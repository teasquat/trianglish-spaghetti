function love.load ()
  time = 0
  P = {x=200, y=200, z=200}

  E = {x,y}
  a = 50
end

function love.update (dt)
  time = time + dt

  --P.y = (math.sin(time)+1)*100

  E.x = a*P.x/(a+P.y)
  E.y = a*P.x/(a+P.y)
end

function love.draw ()
  love.graphics.translate(love.graphics.getWidth()/2, love.graphics.getHeight()/2)
  love.graphics.scale(1, -1)


end
