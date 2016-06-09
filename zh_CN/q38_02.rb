# 定义表示0〜9数字的比特序列
bit = [0b1111110, 0b0110000, 0b1101101, 0b1111001, 0b0110011,
       0b1011011, 0b1011111, 0b1110000, 0b1111111, 0b1111011]

# 事先得出异或运算结果
flip = Array.new(10)
(0..9).each{|i|
  flip[i] = Array.new(10)
  (0..9).each{|j|
    flip[i][j] = (bit[i]^bit[j]).to_s(2).count("1")
  }
}

# 每次设置翻转比特序列的值为初始值
min = 63
(0..9).to_a.permutation.each{|seq|
  sum = 0
  (seq.size - 1).times{|j|
    # 取得保存好的值
    sum += flip[seq[j]][seq[j+1]]
    break if min <= sum
  }
  min = sum if sum < min
}
puts min
