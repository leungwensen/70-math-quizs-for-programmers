N = 10      # 階段の段数
STEPS = 4   # 一気に進める段数

def move(a, b)
  return 0 if a > b    # AさんがBさんよりも上になれば終了
  return 1 if a == b   # 同じ段に止まればカウント
  cnt = 0
  (1..STEPS).each{|da|
    (1..STEPS).each{|db|
      cnt += move(a + da, b - db) # 再帰的に探索
    }
  }
  cnt
end

# Aさんは0の位置から、BさんはNの位置からスタート
puts move(0, N)
