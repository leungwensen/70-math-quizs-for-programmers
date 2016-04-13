# 縦線と横線
v, h = 7, 10
total = 0
# 「下の数」の位置について、交換する必要のある数をカウント
(0..(v-1)).to_a.permutation.each{|final|
  cnt = 0
  v.times{|i|
    cnt += final.take_while{|j| j != i}.count{|k| k > i}
  }
  total += 1 if cnt == h
}
puts total
