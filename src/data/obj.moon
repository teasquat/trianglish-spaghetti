----------------------------------
-- v 0.0  0.0  0.0  0.0
-- v 0.0  0.0  1.0  0.0
-- v 0.0  1.0  0.0  0.0
-- v 0.0  1.0  1.0  0.0
-- v 1.0  0.0  0.0  0.0
-- v 1.0  0.0  1.0  0.0
-- v 1.0  1.0  0.0  0.0
-- v 1.0  1.0  1.0  0.0
-- v 0.0  0.0  0.0  1.0
-- v 0.0  0.0  1.0  1.0
-- v 0.0  1.0  0.0  1.0
-- v 0.0  1.0  1.0  1.0
-- v 1.0  0.0  0.0  1.0
-- v 1.0  0.0  1.0  1.0
-- v 1.0  1.0  0.0  1.0
-- v 1.0  1.0  1.0  1.0
----------------------------------
export class Loader
  ----------------------------------
  -- Function for applying a split.
  ----------------------------------
  split = (s, d) ->
    unless string.find s, d
      return {s}

    m = "(.-)" .. d .. "()"
    t = {}

    i = 0
    local f
    for s, j in string.gmatch s, m
      i += 1
      t[i] = s
      f = j

    unless i == 0
      t[i + 1] = string.sub s, f
    t

  @load: (data) =>
    output = {
      v: {}
      l: {}
    }

    lines = {}

    for line in (data .. "\n")\gmatch "(.-)\n"
      lines[#lines + 1] = line

    for line in *lines
      l = split line, "%s+"

      switch l[1]
        when "v" -- N-dimensional vertex
          v = {}
          for i = 2, #l
            v[i - 1] = tonumber l[i]

          table.insert output.v, v

        when "l" -- Line between the dots
          _l = {}
          for i = 2, #l
            assert output.v[tonumber l[i] ]
            _l[i-1] = output.v[tonumber l[i] ]

          table.insert output.l, _l
          -- inserts a table, filled with positions (position = {x,y,z...})
          -- {{x,y,z...},{x,y,z...},{x,y,z...},...}

    output
