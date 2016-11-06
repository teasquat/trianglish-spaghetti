export class Point_Cube extends Point
  new: (cube, ...) =>
    @cube = cube
    @pos = {...}

  get_N1: (pos) =>
    primes = {} -- e.g. x' = (ax)/(a+z) ...

    for i, v in ipairs pos
        l = a + pos[#pos]
        if i < #pos
          primes[i] = a * v / l
          print(i,#pos)
    primes


  get_N: (n, pos) =>
    unless pos
      pos = [v*@cube.scale+@cube.offset for v in *@pos]

    if #pos <= n
      return pos
    else
      @\get_N(n, @\get_N1(pos))

  draw: =>
    pos = @\get_N(2)
    print(pos, pos[1], pos[2])
    x, y = pos[1], pos[2] or 0

    love.graphics.circle "fill", x, y, 4

  {
    :Point_Cube
  }
