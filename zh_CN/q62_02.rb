# 格子点の数を設定
W, H = 5, 4
# 移動する方向
@move = [[0, 1], [0, -1], [1, 0], [-1, 0]]
@log = {}

# 再帰的に探索する
def search(x, y, depth)
  return 0 if x < 0 || W <= x || y < 0 || H <= y
  return 0 if @log.has_key?(x + y * W)
  return 1 if depth == W * H
  # 半分程度まで探索したら、残りが連結されているかチェック
  if depth == W * H / 2 then
    remain = (0..(W*H-1)).to_a - @log.keys
    check(remain, remain[0])
    return 0 if remain.size > 0
  end
  cnt = 0
  @log[x + y * W] = depth
  @move.each{|m| # 上下左右に移動
    cnt += search(x + m[0], y + m[1], depth + 1)
  }
  @log.delete(x + y * W)
  return cnt
end

# 連結されているかをチェックする
def check(remain, del)
  remain.delete(del)
  left, right, up, down = del - 1, del + 1, del - W, del + W
  # 移動先に同じ色があればその方向を探索
  check(remain, left) if (del % W > 0) && remain.include?(left)
  check(remain, right) if (del % W != W - 1) && remain.include?(right)
  check(remain, up) if (del / W > 0) && remain.include?(up)
  check(remain, down) if (del / W != H - 1) && remain.include?(down)
end

count = 0
(W * H).times{|i|
  count += search(i % W, i / W, 1)
}

# 始点と終点が逆のパターンは同一とみなすので半分にする
puts count / 2
