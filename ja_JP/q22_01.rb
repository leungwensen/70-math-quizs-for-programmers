n = 16
pair = Array.new(n / 2 + 1)
pair[0] = 1

1.upto(n/2){|i|
  pair[i] = 0
  i.times{|j|
    pair[i] += pair[j] * pair[i - j - 1]
  }
}

puts pair[n/2]
