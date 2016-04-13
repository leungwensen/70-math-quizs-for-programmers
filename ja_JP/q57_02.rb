# 縦線と横線
v, h = 7, 10
total = 0
# 「下の数」の順列について、横線の数を調査
(1..v).to_a.permutation.each{|final|
  start = (1..v).to_a
  cnt = 0
  v.times{|i|
    # 「上の数」のどの位置にあるかを調べる
    move = start.index(final[i])
    if move > 0 then
      # 「上の数」を入れ替え
      start[i], start[move] = start[move], start[i]
      cnt += move - i
    end
  }
  total += 1 if cnt == h
}
puts total
