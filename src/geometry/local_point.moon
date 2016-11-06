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

  get_global_pos: (pos = @pos) =>
    pos_r = {}
    -- loop through dimensions of 2D rotation matrix
    for i = 1, #@group.rotations
      r = @group.rotations[i]
      pos_r[i] = @R_n pos[i], r

    pos_g = {}
    for i, v in ipairs pos_r
      pos_g[i] = pos[i] * v * @group.scale + @group.offset[i]
    pos_g

  get_N: (n, pos) =>
    unless pos
      pos = @\get_global_pos!

    if #pos <= n
      return pos
    else
      @\get_N(n, @\get_N1(pos))

  draw: =>
    pos = @\get_N(2)
    x, y = pos[1], pos[2]

    love.graphics.circle "fill", x, y, 4

  -- apply n-dimensional rotation of hyperframe
  R_n: (pos, row) =>
    -- part of matrix-vector product
    p = 0
    for i in *row
      p += pos * i
    p

{
  :Local_Point
}
