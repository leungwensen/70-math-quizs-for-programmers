# 长方形大小
W, H = 5, 4

def check(color, del)
  color.delete(del)
  # 设置移动方向
  left, right, up, down = del - 1, del + 1, del - W, del + W
  # 如果移动方向上有相同颜色，则继续向这个方向搜索
  check(color, left) if (del % W > 0) && color.include?(left)
  check(color, right) if (del % W != W - 1) && color.include?(right)
  check(color, up) if (del / W > 0) && color.include?(up)
  check(color, down) if (del / W != H - 1) && color.include?(down)
end

# 初始化长方形
map = (0.. W*H-1).to_a
count = 0
map.combination(W * H / 2){|blue|             # 把一半标为蓝色
  if blue.include?(0) then                    # 左上角固定为蓝色
    white = map - blue                        # 剩下的是白色
    check(blue, blue[0])                      # 蓝色是否互相连接
    check(white, white[0]) if blue.size == 0  # 白色是否互相连接
    count += 1 if white.size == 0         # 如果两种颜色都符合条件则计入结果
  end
}
puts count
