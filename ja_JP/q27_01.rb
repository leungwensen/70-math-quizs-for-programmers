W, H = 6, 4
DIR = [[0, 1], [-1, 0], [0, -1], [1, 0]] # 移動方向
left = [0] * H   # 縦の線を使用したかビット単位で保管
bottom = [0] * W # 横の線を使用したかビット単位で保管

def search(x, y, dir, left, bottom)
  left_l = left.clone
  bottom_l = bottom.clone
  # 境界を越えた場合、または使用済みの場合は進めない
  if (dir == 0) || (dir == 2) then # 上下に移動した場合
    pos = [y, y + DIR[dir][1]].min
    return 0 if (pos < 0) || (y + DIR[dir][1] > H)
    return 0 if left_l[pos] & (1 << x) > 0
    left_l[pos] |= (1 << x)        # 縦の線を使用済みにする
  else                             # 左右に移動した場合
    pos = [x, x + DIR[dir][0]].min
    return 0 if (pos < 0) || (x + DIR[dir][0] > W)
    return 0 if bottom_l[pos] & (1 << y) > 0
    bottom_l[pos] |= (1 << y)      # 横の線を使用済みにする
  end
  next_x, next_y = x + DIR[dir][0], y + DIR[dir][1]
  return 1 if (next_x == W) && (next_y == H)  # Bについたら終了

  cnt = 0
  # 直進
  cnt += search(next_x, next_y, dir, left_l, bottom_l)
  # 左折
  dir = (dir + 1) % DIR.size
  cnt += search(next_x, next_y, dir, left_l, bottom_l)
  cnt
end

puts search(0, 0, 3, left, bottom) # 始点から右へスタート
