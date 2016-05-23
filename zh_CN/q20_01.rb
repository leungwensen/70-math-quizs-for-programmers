# 把魔方阵保存到数组
magic_square = [1, 14, 14, 4, 11, 7, 6, 9,
                8, 10, 10, 5, 13, 2, 3, 15]

# 统计用哈希表
sum = Hash.new(0)
1.upto(magic_square.size){|i|
  # 对组合进行全量检索
  magic_square.combination(i){|set|
    # 把组合的和值统计保存到哈希表
    sum[set.inject(:+)] += 1
  }
}

# 输出出现次数最多的和值
puts sum.max{|x, y| x[1] <=> y[1]}
