# 从11开始检索
num = 11
while true
  if num.to_s == num.to_s.reverse &&
     num.to_s(8) == num.to_s(8).reverse &&
     num.to_s(2) == num.to_s(2).reverse
    puts num
    break
  end
  # 只检索奇数，每次加2
  num += 2
end
