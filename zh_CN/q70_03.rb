memo = {0x000fff => 0, 0xfff000 => 0, 0xcccccc => 0, 0x333333 => 0}
queue = [0x000fff, 0x333333] # 只保留左上为0的初始值
W, H = 4, 6

mask = []
(W * H).times{|i|
  mask.push((1 << 1 | 1) << i) if i % W < W - 1
  mask.push((1 << W | 1) << i) if i < W * (H - 1)
}

depth = 0
while queue.size > 0 do
  p [depth, queue.size * 2] # 答案乘以2
  depth += 1
  next_queue = []
  queue.map{|q|
    mask.each{|m|
      if ((q & m) != 0) && ((q & m) != m) && !memo.key?(q ^ m) then
        memo[q ^ m] = depth
        # 缓存按位取反的结果
        memo[(q ^ m) ^ ((1 << W * H) - 1)] = depth
        next_queue.push(q ^ m)
      end
    }
  }
  queue = next_queue
end
