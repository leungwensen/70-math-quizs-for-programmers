val = []
256.times{|i|
  # 0〜255で反転
  rev = ('%08b'%i).reverse.to_i(2)

  if i < rev then
    s = i.to_s + rev.to_s
    # 0〜9が重複しない数字であれば対象とする
    val.push([i, rev]) if s.split('').uniq.size == s.length
  end
}

ip = []
val.combination(2){|a, b|
  # 0〜9を一度ずつ使っていればペアとする
  ip.push([a, b]) if (a + b).join.split('').uniq.size == 10
}
# ペアの組み合わせ数を出力
puts ip.size * 8
