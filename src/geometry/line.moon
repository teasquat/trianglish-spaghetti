export class Line extends Local_Point
  new: (group, p1, p2) =>
    @group = group
    @p1 = p1
    @p2 = p2

  draw: =>
    pos1 = @\get_N 2, @\get_global_pos @p1
    pos2 = @\get_N 2, @\get_global_pos @p2
    love.graphics.line pos1[1], pos1[2], pos2[1], pos2[2]

{
  :Line
}
