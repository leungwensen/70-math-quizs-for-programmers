# 把魔方阵保存到数组
magic_square = [1, 14, 14, 4, 11, 7, 6, 9,
                8, 10, 10, 5, 13, 2, 3, 15]
sum_all = magic_square.inject(:+)

# 统计用哈希表
sum = Array.new(sum_all + 1){0}
# 初始值（没有加任何值时）
sum[0] = 1
magic_square.each{|n|
  # 从大数开始按顺序做加法
  (sum_all - n).downto(0).each{|i|
    sum[i + n] += sum[i]
  }
}

# 输出出现次数最多的和值
puts sum.find_index(sum.max)
