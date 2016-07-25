# 人数
@n = 8
# 最短移动距离
@min_step = 98
# 目标状态
@goal = []
(1..@n).each{|i|
  @goal << (1..@n).to_a.reverse.rotate(i)
}

def search(child, oni, oni_pos, step, log)
  if oni == 0 then           # 一开始负责丢手绢的人在圈子外时
    if @goal.include?(child) then
      puts "#{step} #{log}"  # 记录移动距离和丢手绢的人的位置
      @min_step = [step, @min_step].min
      return
    end
  end
  (1..(@n - 1)).each{|i|       # 从现在的丢手绢的人的位置开始遍历
    if step + @n + i <= @min_step then
      next_child = child.clone
      pos = (oni_pos + i) % @n # 下一个丢手绢的人的位置
      next_child[pos] = oni    # 丢手绢的人坐下
      next_oni = child[pos]    # 下一个丢手绢的人离开圈子
      search(next_child, next_oni, pos,
             step + @n + i, log + pos.to_s)
    end
  }
end

# 一开始丢手绢的人坐到1的位置上去
search([0] + (2..@n).to_a, 1, 0, @n, "0")
