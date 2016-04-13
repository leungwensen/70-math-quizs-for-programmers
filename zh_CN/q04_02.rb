def cutbar(m, n)
  count = 0
  current = 1 # currentは現在の長さ
  while n > current do
    current += current < m ? current : m
    count = count + 1
  end
  puts(count)
end

cutbar(3, 20)
cutbar(5, 100)
