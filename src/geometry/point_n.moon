----------------------------------
-- Representing a point in an arbitrary hyperframe,
-- in a coordinate system of N axes.
--
-- Coordinates are structured through the table @pos
-- ... a point is instantiated like the following:
--
-- p = <Point> x, y, z, w, ...
----------------------------------
export class Point
  new: (...) =>
    @pos = {...}

  ----------------------------------
  -- *Teleports* point to given coordinates.
  ----------------------------------
  move: (...) =>
    new_pos = {...}

    assert #new_pos == #@pos
    @pos = new_pos

  ----------------------------------
  -- Translates point by given deltas.
  ----------------------------------
  translate: (...) =>
    delta = {...}

    assert #delta == #@pos

    for i, v in ipairs delta
      @pos[i] += v

  ----------------------------------
  -- *Convenient* getter, for use later.
  ----------------------------------
  get_dimension: =>
    #@pos

  ----------------------------------
  -- Fancy method for projecting point in
  -- the N-1th dimension(where N is the dimension of the point).
  ----------------------------------
  get_N1: (pos) =>
    primes = {} -- e.g. x' = (ax)/(a+z) ...

    for i, v in ipairs pos
        l = a + pos[#pos]
        if i < #pos
          primes[i] = a * v / l
    primes

  ----------------------------------
  -- Method for getting points
  -- in a specific plane (n_th plane)
  -- usage get_N(n) or get_N(n, {x,y,z,...})
  ----------------------------------
  get_N: (n, pos=@pos) =>
    if #pos <= n --if its at the right amount of dimensions
      return pos
    else
      @\get_N(n, @\get_N1(pos)) --get the one below it

  draw: =>
    pos = @\get_N(1)
    x, y = pos[1], pos[2] or 0

    love.graphics.circle "fill", x, y, 4

{
  :Point
}
