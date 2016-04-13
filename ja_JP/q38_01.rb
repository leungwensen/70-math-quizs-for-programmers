# 0〜9を表すビットを定義
bit = [0b1111110, 0b0110000, 0b1101101, 0b1111001, 0b0110011,
       0b1011011, 0b1011111, 0b1110000, 0b1111111, 0b1111011]

# 毎回全ビットを反転させた値を初期値とする
min = 63

# 0〜9の順列について、より切替回数が少ないものを探索する
(0..9).to_a.permutation.each{|seq|
  sum = 0
  (seq.size - 1).times{|j|
    # 排他的論理和を計算し、1が立っているビット数をカウント
    sum += (bit[seq[j]]^bit[seq[j+1]]).to_s(2).count("1")
    break if min <= sum
  }
  min = sum if min > sum
}
puts min
