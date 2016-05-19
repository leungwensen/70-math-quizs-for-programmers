def check(last_n, used, list)
  # 已经全部使用，如果和最初的“1”相加能得到平方数，则结束递归
  return [1] if used.all? && (list[1].include?(last_n))
  list[last_n].each{|i|           # 逐一尝试候补数字
    if used[i - 1] == false then  # 没有全部使用的情况
      used[i - 1] = true
      result = check(i, used, list)
      # 找到的时候，添加这个值
      return [i] + result if result.size > 0
      used[i - 1] = false
    end
  }
  []
end

n = 2
while true do
  square = (2..Math.sqrt(n * 2).floor).map{|i| i ** 2}
  # 找到可以作为相邻数字的候补数字
  list = {}
  (1..n).each{|i|
    list[i] = square.map{|s| s - i}.select{|s| s > 0}
  }
  # 把“1”设置为已使用，从“1”开始搜索
  result = check(1, [true] + [false] * (n - 1), list)
  break if result.size > 0
  n += 1
end
puts n
p result
