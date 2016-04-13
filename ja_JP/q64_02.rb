N = 5
MASK = (1 << (N * N)) - 1
# 移動した位置をビット演算で算出
@move = [lambda{|m| (m >> 1) & 0b0111101111011110111101111},
         lambda{|m| (m << N) & MASK},
         lambda{|m| (m << 1) & 0b1111011110111101111011110},
         lambda{|m| m >> N}]

# 有効な迷路かを判定
def enable(maze)
  man = (1 << (N * N - 1)) & (MASK - maze) # 左上からスタート
  while true do
    next_man = man
    @move.each{|m| next_man |= m.call(man)} # 上下左右に移動
    next_man &= (MASK - maze)        # 壁以外の部分が移動可能
    return true if next_man & 1 == 1 # 右下にたどり着けば有効
    break if man == next_man
    man = next_man
  end
  false
end

# map:壁の配置
# p1, d1: 1人目の位置、移動方向
# p2, d2: 2人目の位置、移動方向
def search(maze, p1, d1, p2, d2, turn)
  if turn then
    return true if p1 == p2 # 2人が出会った
    # どちらかのゴールに着いた
    return false if (p1 == 1) || (p2 == 1 << (N * N - 1))
  end
  @move.size.times{|i| # 右手法で動ける方向を探索
    d = (d1 - 1 + i) % @move.size
    if @move[d].call(p1) & (MASK - maze) > 0 then
      return search(maze, p2, d2, @move[d].call(p1), d, !turn)
    end
  }
  false
end

cnt = 0
(1 << N * N).times{|maze|
  if enable(maze) then
    man_a, man_b = 1 << (N * N - 1), 1
    cnt += 1 if search(maze, man_a, 3, man_b, 1, true)
  end
}
puts cnt
