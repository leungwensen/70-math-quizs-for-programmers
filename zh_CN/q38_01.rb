# 设置反转用的掩码
mask = Array.new(16)
4.times{|row|
  4.times{|col|
    mask[row * 4 + col] =
      (0b1111 << (row * 4)) | (0b1000100010001 << col)
  }
}

max = 0
# 保存步骤数目的数组
steps = Array.new(1 << 16, -1)
# 从所有方格都为白色开始
steps[0] = 0
# 检查对象的数组
scanner = [0]
while scanner.size > 0 do
  check = scanner.shift
  next_steps = steps[check] + 1
  16.times{|i|
    n = check ^ mask[i]
    # 如果未检查过，则进一步检索
    if steps[n] == -1 then
      steps[n] = next_steps
      scanner.push(n)
      max = next_steps if max < next_steps
    end
  }
end

puts max # 最大步骤数
puts steps.index(max).to_s(2) # 初始状态的方格：全部黑色
p steps.select{|i| i == -1} # 不存在不能全部变为白色的初始状态
