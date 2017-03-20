# 竖线和横线
v, h = 7, 10
total = 0
# 对所有“下方的数字”排列，计算横线数目
(1..v).to_a.permutation.each{|final|
  start = (1..v).to_a
  cnt = 0
  v.times{|i|
    # 找出对应“上方的数字”的位置
    move = start.index(final[i])
    if move > 0 then
      # 更换“上方的数字”
      start[i], start[move] = start[move], start[i]
      cnt += move - i
    end
  }
  total += 1 if cnt == h
}
puts total
