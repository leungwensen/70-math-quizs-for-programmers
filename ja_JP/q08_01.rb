N = 12

def move(log)
  # 最初の位置を含んで、N+1個調べれば終了
  return 1 if log.size == N + 1

  cnt = 0
  # 前後左右に移動
  [[0, 1], [0, -1], [1, 0], [-1, 0]].each{|d|
    next_pos = [log[-1][0] + d[0], log[-1][1] + d[1]]
    # 探索済みでなければ移動させる
    if !log.include?(next_pos) then
      cnt += move(log + [next_pos])
    end
  }
  cnt
end

puts move([[0, 0]])
