def check(n, pre, log, square)
  if n == log.size then
    # 全部放置结束
    if square.include?(1 + pre) then
      # 1和最后一个数之和为平方数时
      puts n
      p log
      return true # 只要找到1种解法就结束
    end
  else
    ((1..n).to_a - log).each{|i| # 遍历没有被使用的数字
      if square.include?(pre + i) then
        # 如果和前一个数之和为平方数
        return true if check(n, i, log + [i], square)
      end
    }
  end
  false
end

n = 2
while true do
  # 事先计算平方数（最大值为n的2倍）
  square = (2..Math.sqrt(n * 2).floor).map{|i| i ** 2}
  break if check(n, 1, [1], square)
  n += 1
end
