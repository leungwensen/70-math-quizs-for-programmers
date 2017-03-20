N = 7
checked = {(1..N).to_a => 0} # 已检查的数组
check = [(1..N).to_a]        # 检查目标
depth = 0                    # 交换次数

while check.size > 0 do      # 如果存在检查目标，则循环
  next_check = []
  (0..(N-1)).to_a.combination(2){|i, j|  # 选择两个数字交换
    check.each{|c|
      d = c.clone
      d[i], d[j] = d[j], d[i]
      if !checked.has_key?(d) then
        checked[d] = depth + 1
        next_check << d
      end
    }
  }
  check = next_check
  depth += 1
end

puts checked.values.inject(:+)
