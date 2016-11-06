export class Group
  new: (points, scale=1, offset=0) =>
    @scale = scale
    @offset = [0 for i in *points] --table filled with as many 0s as points has points

    @points = [Local_Point(@, v) for i, v in ipairs(points)]

  draw: =>
    for v in *@points
      v\draw!

{
  :Group
}
