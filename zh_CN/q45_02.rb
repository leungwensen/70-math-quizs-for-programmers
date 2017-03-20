count = 0
(1..7).to_a.permutation.each{|ary|
  ary.size.times{|i|
    j = ary.index(i + 1)
    if i != j then
      ary[i], ary[j] = ary[j], ary[i]
      count += 1
    end
  }
}
puts count
