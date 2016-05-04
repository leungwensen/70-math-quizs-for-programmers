a = b = 1
count = 0
while (count < 11) do
  c = a + b
  # 分开各个数位进行求和
  sum = 0
  c.to_s.split(//).each {|e| sum += e.to_i}
  if (c % sum == 0) then
    # 输出能整除的情况
    puts c
    count += 1
  end
  a, b = b, c
end
