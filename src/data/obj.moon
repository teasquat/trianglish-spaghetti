----------------------------------
-- tesseract.wtf
--
-- [header]
-- 4
-- [v]
-- 0.0  0.0  0.0  0.0
-- 0.0  0.0  1.0  0.0
-- 0.0  1.0  0.0  0.0
-- 0.0  1.0  1.0  0.0
-- 1.0  0.0  0.0  0.0
-- 1.0  0.0  1.0  0.0
-- 1.0  1.0  0.0  0.0
-- 1.0  1.0  1.0  0.0
--
-- 0.0  0.0  0.0  1.0
-- 0.0  0.0  1.0  1.0
-- 0.0  1.0  0.0  1.0
-- 0.0  1.0  1.0  1.0
-- 1.0  0.0  0.0  1.0
-- 1.0  0.0  1.0  1.0
-- 1.0  1.0  0.0  1.0
-- 1.0  1.0  1.0  1.0
----------------------------------
export class Loader
  @load: (data) =>
    output = {
      v: {}
    }

    lines = {}

    for line in (data .. "\n")\gmatch "(.-)\n"
      lines[#lines + 1] = line

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

    for line in *lines
      l = split line, "%s+"

      switch l[1]
        when "v" -- N-dimensional vertex
          v = {}
          for i = 2, #l
            v[i - 1] = tonumber l[i]

          table.insert output.v, v
    output
