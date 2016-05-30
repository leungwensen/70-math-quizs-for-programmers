W, H = 6, 4
DIR = [[0, 1], [-1, 0], [0, -1], [1, 0]] # 前进方向
left = [0] * H   # 用二进制表示某根竖线是否已通过
bottom = [0] * W # 用二进制表示某根横线是否已通过

def search(x, y, dir, left, bottom)
  left_l = left.clone
  bottom_l = bottom.clone
  # 已经越界或者已通过的情况下无法前行
  if (dir == 0) || (dir == 2) then # 前后移动的情况
    pos = [y, y + DIR[dir][1]].min
    return 0 if (pos < 0) || (y + DIR[dir][1] > H)
    return 0 if left_l[pos] & (1 << x) > 0
    left_l[pos] |= (1 << x)        # 把竖线标记为已通过
  else                             # 左右移动的情况
    pos = [x, x + DIR[dir][0]].min
    return 0 if (pos < 0) || (x + DIR[dir][0] > W)
    return 0 if bottom_l[pos] & (1 << y) > 0
    bottom_l[pos] |= (1 << y)      # 把横线标记为已通过
  end
  next_x, next_y = x + DIR[dir][0], y + DIR[dir][1]
  return 1 if (next_x == W) && (next_y == H)  # 到达B点则结束

  cnt = 0
  # 前进
  cnt += search(next_x, next_y, dir, left_l, bottom_l)
  # 左转
  dir = (dir + 1) % DIR.size
  cnt += search(next_x, next_y, dir, left_l, bottom_l)
  cnt
end

puts search(0, 0, 3, left, bottom) # 从起点右转开始
