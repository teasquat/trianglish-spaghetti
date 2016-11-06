----------------------------------
-- Representing a point in an arbitrary hyperframe,
-- in a coordinate system of N axes.
--
-- Coordinates are structured through the table @pos
-- ... a point is instantiated like the following:
--
-- p = <Point> x, y, z, w, ...
----------------------------------
class
  new: (...) =>
    @pos = table.pack ...

  ----------------------------------
  -- *Teleports* point to given coordinates.
  ----------------------------------
  move: (...) =>
    new_pos = table pack ...

    assert #new_pos == #@pos
    @pos = new_pos

  ----------------------------------
  -- Translates point by given deltas.
  ----------------------------------
  translate: (...) =>
    delta = table.pack ...

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
    l = a + @z

    {
      a * @x / l
      a * @y / l
    }

  ----------------------------------
  -- Fancy method for projecting point in
  -- the N-1th dimension(where N is the dimension of the point).
  ----------------------------------
  get_N1: =>
    primes = {} -- e.g. x' = (ax)/(a+z) ...

    for i, v in ipairs @pos
      if i < #@pos
        l = a + @pos[i + 1]
        -- only x' and y' are calculated with shared scalar
        unless i > 2
          l = a + @pos[3]

        primes[i] = a * v / l

    primes

  draw: =>
    {x, y} = @get_2d!
    love.graphics.circle "fill", x, y, radius
