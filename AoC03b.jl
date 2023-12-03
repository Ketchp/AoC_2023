input = """..."""

lines = split(input, '\n')
for i in 1:length(lines)
    lines[i] = "." * lines[i] * "."
end

rows = length(lines)
cols = length(lines[1])

schem = fill(-1, (rows, cols))

for i in 1:rows
    buffer = ""
    for j in 1:cols
        c = lines[i][j]
        if isdigit(c)
          buffer *= c
        elseif length(buffer) > 0
          num = parse(Int, buffer)
          num_l = length(buffer)
          for dx in 1:num_l
            schem[i, j-dx] = num
          end
          buffer = ""
        end
    end
end

res = 0
for i in 1:rows
    for j in 1:cols
      c = lines[i][j]
      if c == '*'
        cnt = 0
        ratio = 1

        for dy in [-1, 0, 1]
          if i+dy < 1 || i+dy > rows
            continue
          end
          if schem[i+dy, j] != -1
            cnt += 1
            ratio *= schem[i+dy, j]
          else
            for dx in [-1, 1]
              if schem[i+dy, j+dx] != -1
                cnt += 1
                ratio *= schem[i+dy, j+dx]
              end
            end
          end
        end

        if cnt == 2
          res += ratio
        end
      end
  end
end

println(res)
