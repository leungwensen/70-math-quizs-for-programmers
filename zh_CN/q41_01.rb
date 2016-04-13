ip = Array.new
(1 << 16).times{|i|
  # 16ビットの数を反転する
  j = ('%016b' % i).reverse.to_i(2)

  # 10進数のドット区切りの文字列を生成
  s = '%d.%d.%d.%d' % [i>>8, i&0xff, j>>8, j&0xff]

  # 10個の数字とドットだけの場合、配列に追加
  ip.push(s) if s.split("").uniq.length == 11
}
puts ip.size
puts ip
