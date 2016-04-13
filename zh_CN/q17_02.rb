N = 30
boy, girl = 1, 0
N.times{|i|
  # n-1人まで並んでいる状態から求める
  boy, girl = boy + girl, boy
}
puts boy + girl
