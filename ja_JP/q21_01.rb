count = 0     # 「0」が出現した回数
line = 1      # 現在の行数
row = [1]     # 現在の行の値

while count < 2014 do
  next_row = [1]
  # 前行から排他的論理和で次の行をセット
  (row.size - 1).times{|i|
    cell = row[i] ^ row[i + 1]
    next_row.push(cell)
    count += 1 if cell == 0  # 「0」の場合にカウント
  }
  next_row.push(1)
  line += 1                  # 行数を増やして次の行へ
  row = next_row
end

puts line        # 2014個カウントした行を出力
