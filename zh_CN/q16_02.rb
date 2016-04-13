MAX = 500

cnt = 0
(1..MAX/4).each{|c|      # 正方形の一辺
  (1..(c-1)).to_a.combination(2){|a, b|
    if a * a + b * b == c * c then
      cnt += 1 if a.gcd(b) == 1
    end
  }
}
puts cnt
