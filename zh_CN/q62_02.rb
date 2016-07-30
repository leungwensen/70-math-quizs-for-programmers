# 设置方格点数目
W, H = 5, 4
# 移动方向
@move = [[0, 1], [0, -1], [1, 0], [-1, 0]]
@log = {}

# 递归遍历
def search(x, y, depth)
  return 0 if x < 0 || W <= x || y < 0 || H <= y
  return 0 if @log.has_key?(x + y * W)
  return 1 if depth == W * H
  # 遍历到一半，检查剩下的点是否连结
  if depth == W * H / 2 then
    remain = (0..(W*H-1)).to_a - @log.keys
    check(remain, remain[0])
    return 0 if remain.size > 0
  end
  cnt = 0
  @log[x + y * W] = depth
  @move.each{|m| # 上下左右移动
    cnt += search(x + m[0], y + m[1], depth + 1)
  }
  @log.delete(x + y * W)
  return cnt
end

# 检查是否连结
def check(remain, del)
  remain.delete(del)
  left, right, up, down = del - 1, del + 1, del - W, del + W
  # 如果前方是同色的，则检索
  check(remain, left) if (del % W > 0) && remain.include?(left)
  check(remain, right) if (del % W != W - 1) && remain.include?(right)
  check(remain, up) if (del / W > 0) && remain.include?(up)
  check(remain, down) if (del / W != H - 1) && remain.include?(down)
end

count = 0
(W * H).times{|i|
  count += search(i % W, i / W, 1)
}

# 起点终点互换位置得到的路径和原先一致，所以最终数目减半
puts count / 2
