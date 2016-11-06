export class Group
  new: (points, scale=1, offset=0) =>
    @scale = scale
    @offset = [0 for i in *points] --table filled with as many 0s as points has points

    @rotations = {
        {(math.cos test_a), -(math.sin test_a), 0, 0}
        {(math.sin test_a), (math.cos test_a), 0, 0}
        {0, 0, 1, 0}
        {0, 0, 0, 1}
    } -- rotation matrix N
    -- for x = 1, #points[1] -- construct 2D matrix of N rotations
    --   ax = {}
    --   for y = 1, #points[1]
    --     ax[#ax + 1] = 0
    --     if x == y
    --       ax[#ax] = 1
    --   @rotations[#@rotations + 1] = ax


    @points = [Local_Point(@, v) for i, v in ipairs(points)]
    @lines = {}

  add_lines: (lines) =>

    --@lines = [Line(@points[v[1]], @points[v[2]]) for i, v in ipairs(lines)]
    for i, v in ipairs(lines)
      table.insert @lines, Line(@, v[1], v[2])

  draw: =>
    for v in *@points
      v\draw!

    for v in *@lines
      v\draw!

  draw_lines: =>

{
  :Group
}
