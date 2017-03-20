N = 10

# 加到原始数（比特列）后，返回算珠移动个数
def move(bit, add)
  base = 0
  N.times{|i|
    base += i + 1 if (bit & (1 << i)) > 0
  }

  # 确认十位上5的算珠位置
  a0, a1 = (base + add).divmod(50)
  b0, b1 = base.divmod(50)

  # 确认十位上1的算珠位置
  a2, a3 = a1.divmod(10)
  b2, b3 = b1.divmod(10)

  # 确认个位上算珠的位置
  a4, a5 = a3.divmod(5)
  b4, b5 = b3.divmod(5)

  # 由所有位置差相加计算移动量
  (a0 - b0).abs + (a2 - b2).abs + (a4 - b4).abs + (a5 - b5).abs
end

@memo = Hash.new(0)
@memo[(1 << N) - 1] = 0

# 求从1~10求和时，最少的算珠移动量
def search(bit)
  return @memo[bit] if @memo.has_key?(bit)
  min = 1000
  N.times{|i|
    if bit & (1 << i) == 0 then
      min = [min, move(bit, i + 1) + search(bit | (1 << i))].min
    end
  }
  @memo[bit] = min
end

puts search(0)
