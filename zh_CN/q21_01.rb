count = 0     # “0”出现的次数
line = 1      # 当前行的行数
row = [1]     # 当前行的值

while count < 2014 do
  next_row = [1]
  # 通过上一行计算异或得到下一行
  (row.size - 1).times{|i|
    cell = row[i] ^ row[i + 1]
    next_row.push(cell)
    count += 1 if cell == 0  # 统计“0”出现的次数
  }
  next_row.push(1)
  line += 1                  # 增加行数，进入下一行处理
  row = next_row
end

puts line        # 统计到2014个“0”时的行
