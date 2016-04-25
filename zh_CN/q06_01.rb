# 检测是否形成环
def is_loop(n)
  # 最开始乘以3加1
  check = n * 3 + 1
  # 一直循环到数字变为1
  while check != 1 do
    check = check.even? ? check / 2 : check * 3 + 1
    return true if check == n
  end
  return false
end

# 检查2～10000之间的所有偶数
puts 2.step(10000, 2).count{|i|
  is_loop(i)
}
