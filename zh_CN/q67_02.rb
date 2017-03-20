N = 6
FREE, USED, WALL = 0, 1, 9

@memo = {}

def search(seat)
  return @memo[seat] if @memo.has_key?(seat)
  count = 0
  # 搜索邻座没有人的座位
  seat.size.times{|i|
    if seat[i] == FREE then
      if (seat[i - 1] != USED) && (seat[i + 1] != USED) then
        # 如果有空着的座位，则坐下，接着进入下一轮搜索
        seat[i] = USED
        count += search(seat)
        seat[i] = FREE
      end
    end
  }
  # 存在邻座没有人的座位则采用上述逻辑，剩余的数目用阶乘计算
  @memo[seat] = (count > 0) ? count : (1..seat.count(FREE)).inject(:*)
end

puts search([WALL] + [FREE] * N + [WALL] + [FREE] * N + [WALL])
