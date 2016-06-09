# 定义表示0〜9数字的比特序列
bit = [0b1111110, 0b0110000, 0b1101101, 0b1111001, 0b0110011,
       0b1011011, 0b1011111, 0b1110000, 0b1111111, 0b1111011]

# 每次设置翻转比特序列的值为初始值
min = 63

# 在0～9组成的序列中，检索替换次数最少的序列
(0..9).to_a.permutation.each{|seq|
  sum = 0
  (seq.size - 1).times{|j|
    # 执行异或运算，计算结果中1的个数
    sum += (bit[seq[j]]^bit[seq[j+1]]).to_s(2).count("1")
    break if min <= sum
  }
  min = sum if min > sum
}
puts min
