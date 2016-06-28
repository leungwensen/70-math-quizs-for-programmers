# 加到原始数后，返回算珠移动个数
def move(base, add)
  # 确认十位上5的算珠位置
  a0, a1 = (base + add).divmod(50)
  b0, b1 = base.divmod(50)

  # 确认十位上1的算珠位置
  a2, a3 = a1.divmod(10)
  b2, b3 = b1.divmod(10)

  # 确认个位上算珠的位置
  a4, a5 = a3.divmod(5)
  b4, b5 = b3.divmod(5)

  # 由所有位置差相加计算移动量
  (a0 - b0).abs + (a2 - b2).abs + (a4 - b4).abs + (a5 - b5).abs
end

# 对移动序列计算移动量
def count(list)
  cnt = total = 0
  list.each{|i|
    cnt += move(total, i)
    total += i
  }
  cnt
end

# 从1~10的排列序列中求最少的算珠移动量
min = 100
(1..10).to_a.permutation(10){|s|
  min = [min, count(s)].min
}
puts min
