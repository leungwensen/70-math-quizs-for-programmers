# 竖线和横线
v, h = 7, 10
total = 0
# 对“下方的数字”，统计需要交换位置的数字
(0..(v-1)).to_a.permutation.each{|final|
  cnt = 0
  v.times{|i|
    cnt += final.take_while{|j| j != i}.count{|k| k > i}
  }
  total += 1 if cnt == h
}
puts total
