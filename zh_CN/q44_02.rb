cnt = 0
10.step(100, 2){|a|
  (1..(a / 2 - 1)).each{|c|
    b = a - c
    cnt += 1 if b.gcd(c) == 1
  }
}
puts cnt
