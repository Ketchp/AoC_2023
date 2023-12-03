input = """..."""

lines = split(input, '\n')
for i in 1:length(lines)
    lines[i] = "." * lines[i] * "."
end

rows = length(lines)
cols = length(lines[1])

res = 0
for i in 1:rows
    buffer = ""
    for j in 1:cols
        c = lines[i][j]
        if isdigit(c)
          buffer *= c
        elseif length(buffer) > 0
          is_part = false
          num = parse(Int, buffer)
          num_l = length(buffer)
          for dy in [-1, 1]
            if i+dy < 1 || rows < i+dy
              continue
            end
            for dx in 0:(num_l+1)
              ng = lines[i+dy][j-dx]
              if ng != '.' && !isdigit(ng)
                is_part = true
              end
            end
          end
          if c != '.'
            is_part = true
          end
          if lines[i][j-num_l-1] != '.'
            is_part = true
          end
          if is_part
            res += num
          end
          buffer = ""
        end
    end
end

println(res)
