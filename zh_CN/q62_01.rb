# 格子点の数を設定
W, H = 5, 4
# 移動する方向
@move = [[0, 1], [0, -1], [1, 0], [-1, 0]]

@map = Array.new(W * H, false)

# 再帰的に探索する
def search(x, y, depth)
  return 0 if x < 0 || W <= x || y < 0 || H <= y || @map[x + y * W]
  return 1 if depth == W * H
  cnt = 0
  @map[x + y * W] = true
  @move.each{|m| # 上下左右に移動
    cnt += search(x + m[0], y + m[1], depth + 1)
  }
  @map[x + y * W] = false
  return cnt
end

count = 0
(W * H).times{|i|
  count += search(i % W, i / W, 1)
}
# 始点と終点が逆のパターンは同一とみなすので半分にする
puts count / 2
