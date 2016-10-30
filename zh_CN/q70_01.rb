# 把终止状态设置为初始值
memo = {0x000fff => 0, 0xfff000 => 0, 0xcccccc => 0, 0x333333 => 0}
queue = memo.keys
W, H = 4, 6

# 指定可能交换的位置
mask = []
(W * H).times{|i|
  mask.push((1 << 1 | 1) << i) if i % W < W - 1 # 横向相邻
  mask.push((1 << W | 1) << i) if i < W * (H - 1) # 纵向相邻
}

depth = 0
while queue.size > 0 do # 遍历所有情况
  p [depth, queue.size]
  depth += 1
  next_queue = []
  queue.map{|q|
    mask.each{|m|
      # 除去2个位置“都是0”或者“都是1”的情况以外，遍历未搜索的部分
      if ((q & m) != 0) && ((q & m) != m) && !memo.key?(q ^ m) then
        memo[q ^ m] = depth
        next_queue.push(q ^ m)
      end
    }
  }
  queue = next_queue
end
