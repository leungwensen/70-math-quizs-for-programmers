n = (1..50).select{|i| (i % 2 > 0) || (i % 5 > 0)}
answer = Array.new
k = 1
while (n.size > 0) do
  x = k.to_s(2).to_i * 7
  n.each{|i|
    if x % i == 0 then
      answer << i if x.to_s == x.to_s.reverse
      n.delete(i)
    end
  }
  k += 1
end
puts answer.sort
