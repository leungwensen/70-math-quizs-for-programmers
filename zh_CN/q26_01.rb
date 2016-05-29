W, H = 10, 10
# 设置停车场状态（用数字“9”作为边界）
parking = Array.new(W + 2){Array.new(H + 2){1}}
(W + 2).times{|w|
  parking[w][0] = parking[w][H + 1] = 9
}
(H + 2).times{|h|
  parking[0][h] = parking[W + 1][h] = 9
}

# 目标是左上角车的状态
@goal = Marshal.load(Marshal.dump(parking))
@goal[1][1] = 2

# 开始位置是右下角的状态
start = Marshal.load(Marshal.dump(parking))
start[W][H] = 2

def search(prev, depth)
  target = []
  prev.each{|parking, w, h|
    # 上下左右移动
    [[-1, 0], [1, 0], [0, -1], [0, 1]].each{|dw, dh|
      nw, nh = w + dw, h + dh
      if (parking[nw][nh] != 9) then
        # 如果是边界以外的情况，则检查是否已经遍历
        temp = Marshal.load(Marshal.dump(parking))
        temp[w][h], temp[nw][nh] = temp[nw][nh], temp[w][h]
        if !@log.has_key?([temp, nw, nh]) then
          # 把未遍历的位置作为遍历目标
          target.push([temp, nw, nh])
          @log[[temp, nw, nh]] = depth + 1
        end
      end
    }
  }
  return if target.include?([@goal, W, H])
  # 广度优先搜索
  search(target, depth + 1) if target.size > 0
end

# 记录已搜索部分
@log = {}
@log[[start, W, H - 1]] = 0
@log[[start, W - 1, H]] = 0
# 从开始位置开始搜索
search([[start, W, H - 1], [start, W - 1, H]], 0)
# 输出到达目标的搜索次数
puts @log[[@goal, W, H]]
