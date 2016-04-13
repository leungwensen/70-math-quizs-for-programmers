count = 0     # 「0」が出現した回数
line = 1      # 現在の行数
row = 1       # 現在の行の値（ビット列）

while count < 2014 do
  row ^= row << 1     # 前行から排他的論理和で次の行をセット
  count += row.to_s(2).count("0")    # 「0」の数をカウント
  line += 1
end

puts line        # 2014個カウントした行を出力
