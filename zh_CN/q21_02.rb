count = 0     # “0”出现的次数
line = 1      # 当前行的行数
row = 1       # 当前行的值（二进制码）

while count < 2014 do
  row ^= row << 1     # 从前一行做异或运算得到下一行
  count += row.to_s(2).count("0")    # 统计“0”出现的次数
  line += 1
end

puts line        # 统计到2014个“0”时的行
