# 元の数に加算した場合に移動する量を返す
def move(base, add)
  # 10の位の5の玉の位置を確認
  a0, a1 = (base + add).divmod(50)
  b0, b1 = base.divmod(50)

  # 10の位の1の玉の位置を確認
  a2, a3 = a1.divmod(10)
  b2, b3 = b1.divmod(10)

  # 1の位の玉の位置を確認
  a4, a5 = a3.divmod(5)
  b4, b5 = b3.divmod(5)

  # すべての位置の差から動かす量を加算
  (a0 - b0).abs + (a2 - b2).abs + (a4 - b4).abs + (a5 - b5).abs
end

# 移動するリストに対して、移動量を合計
def count(list)
  cnt = total = 0
  list.each{|i|
    cnt += move(total, i)
    total += i
  }
  cnt
end

# 1〜10までの順列について最少の移動量を求める
min = 100
(1..10).to_a.permutation(10){|s|
  min = [min, count(s)].min
}
puts min
