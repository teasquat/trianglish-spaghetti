export class Local_Point extends Point
  new: (group, ...) =>
    @group = group -- assumes that group.scale and group.offset or not nil
    @pos = {...}
    if type @pos[1] =="table" -- makes it so Local_Point(@, {}) is viable
      @pos = @pos[1]

  get_N1: (pos) =>
    primes = {} -- e.g. x' = (ax)/(a+z) ...

    for i, v in ipairs pos
        l = a + pos[#pos]
        if i < #pos
          primes[i] = a * v / l
    primes

  get_global_pos: (pos) =>
    if pos
      [v*@group.scale+@group.offset[i] for i, v in ipairs pos]
    else
      [v*@group.scale+@group.offset[i] for i, v in ipairs @pos]

  get_N: (n, pos) =>
    unless pos
      pos = [v*@group.scale+@group.offset[i] for i, v in ipairs @pos]

    if #pos <= n
      return pos
    else
      @\get_N(n, @\get_N1(pos))

  draw: =>
    pos = @\get_N(2)
    x, y = pos[1], pos[2]

    love.graphics.circle "fill", x, y, 4

{
  :Local_Point
}
