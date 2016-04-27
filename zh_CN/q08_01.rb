N = 12

def move(log)
  # 包含最初位置，一共搜索N + 1次
  return 1 if log.size == N + 1

  cnt = 0
  # 前后左右移动
  [[0, 1], [0, -1], [1, 0], [-1, 0]].each{|d|
    next_pos = [log[-1][0] + d[0], log[-1][1] + d[1]]
    # 如果前方是没有搜索过的点，则可以前进
    if !log.include?(next_pos) then
      cnt += move(log + [next_pos])
    end
  }
  cnt
end

puts move([[0, 0]])
