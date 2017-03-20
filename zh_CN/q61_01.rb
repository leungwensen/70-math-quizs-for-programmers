# 设置方格点数目
W, H = 5, 4
# 移动方向
@move = [[0, 1], [0, -1], [1, 0], [-1, 0]]

@map = Array.new(W * H, false)

# 递归遍历
def search(x, y, depth)
  return 0 if x < 0 || W <= x || y < 0 || H <= y || @map[x + y * W]
  return 1 if depth == W * H
  cnt = 0
  @map[x + y * W] = true
  @move.each{|m| # 上下左右移动
    cnt += search(x + m[0], y + m[1], depth + 1)
  }
  @map[x + y * W] = false
  return cnt
end

count = 0
(W * H).times{|i|
  count += search(i % W, i / W, 1)
}
# 起点终点互换位置得到的路径和原先一致，所以最终数目减半
puts count / 2
