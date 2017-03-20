N = 6
FREE, USED, WALL = 0, 1, 9

# 在两边和正中间设置墙壁做为边界
@seat = [WALL] + [FREE] * N + [WALL] + [FREE] * N + [WALL]

def search(person)
  count = 0
  # 搜索邻座没有人的座位
  @seat.size.times{|i|
    if @seat[i] == FREE then
      if (@seat[i - 1] != USED) && (@seat[i + 1] != USED) then
        # 如果有空着的座位，则坐下，接着进入下一轮搜索
        @seat[i] = USED
        count += search(person + 1)
        @seat[i] = FREE
      end
    end
  }
  # 存在邻座没有人的座位则采用上述逻辑，剩余的数目用阶乘计算
  (count > 0) ? count : (1..@seat.count(FREE)).inject(:*)
end

puts search(0)
