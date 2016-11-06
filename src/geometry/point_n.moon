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
  -- The arbitrary point as projected on a
  -- two-dimensional plane.
  ----------------------------------
  get_2D: (primes) =>
    ----------------------------------
    -- Approaching recursive projection.
    -- Projecting N-1 primes(projections).
    ----------------------------------
    if #primes == 2
      return primes
    else
      @\get_N1 primes

  ----------------------------------
  -- Fancy method for projecting point in
  -- the N-1th dimension(where N is the dimension of the point).
  ----------------------------------
  get_N1: =>
    primes = {} -- e.g. x' = (ax)/(a+z) ...

    for i, v in ipairs @pos
        l = a + @pos[#@pos]
        if i < #@pos
          l = a + @pos[3]

          primes[i] = a * v / l

    primes

  draw: =>
    pos = @get_2D @pos
    x, y = pos[1], pos[2]

    love.graphics.circle "fill", x, y, 4

{
  :Point
}
