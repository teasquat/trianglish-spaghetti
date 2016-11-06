export class Group
  new: (points, scale=1, offset=0) =>
    @scale = scale
    @offset = offset

    @points = {}
    --@points = [Local_Point(@, v) for v in *points]
    for i, v in ipairs(points)
      @points[i] = Local_Point(@, v)

  draw: =>
    for v in *@points
      v\draw!

{
  :Group
}
