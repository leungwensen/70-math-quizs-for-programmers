N = 30
boy, girl = 1, 0
N.times{|i|
  # 求已排列n-1人时的状态
  boy, girl = boy + girl, boy
}
puts boy + girl
